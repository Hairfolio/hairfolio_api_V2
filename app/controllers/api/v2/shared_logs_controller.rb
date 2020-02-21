class Api::V2::SharedLogsController < ApplicationController
 before_action :authenticate_with_token!, only: [:create,:email_share_log]

 def create
  title = log_params[:title].blank? ? LogDefault.first.title : log_params[:title]
  description = log_params[:description].blank? ? LogDefault.first.description : log_params[:description]
  note_id = log_params[:note_id]
  log = SharedLog.create(title: title,description:description,note_id: note_id)
  if log.save
   note_id = params[:shared_log][:note_id]
   user_id = Note.find(note_id).contact.user_id
   if Refer.exists?(user_id: user_id,note_id: note_id)
    @unique_code = Refer.where(user: user_id,note_id: note_id).first.unique_code
   else
    @unique_code = SecureRandom.hex(7)
    Refer.create(user_id: user_id, note_id:note_id, unique_code:@unique_code) if user_id && note_id
   end
   # @note = Note.find(note_id)
   # url = "http://54.183.167.119:8000/logdetails/#{@unique_code}/#{log.id}"
   url = "http://54.183.167.119/v2/shared_log_meta_data/#{@unique_code}/#{log.id}"
   render json: {data: log,url: url}, status: 201
  else
   render json: { errors: log.errors }, status: 422
  end
 end

 def shared_log_meta_data
  @log = SharedLog.find(params[:id])
  @unique_code = params[:unique_code]
  set_meta_tags description: @log.description,
                refresh:5,
                og:{
                    title: @log.title,
                    description: @log.description,
                    type: "website",
                    url: "",
                    image: @log.note.photos.present? ? @log.note.photos.first.asset_url : "https://hairfolioapp.s3.us-west-1.amazonaws.com/post/11558905_hf_imagedisplay.png"
                }
 end

 def email_share_log
  title = log_params[:title].blank? ? LogDefault.first.title : log_params[:title]
  description = log_params[:description].blank? ? LogDefault.first.description : log_params[:description]
  note_id = log_params[:note_id]
  log = SharedLog.create(title: title,description:description,note_id: note_id)
  if log.save
   note_id = params[:shared_log][:note_id]
   user_id = Note.find(note_id).contact.user_id
   if Refer.exists?(user_id: user_id,note_id: note_id)
    @unique_code = Refer.where(user: user_id,note_id: note_id).first.unique_code
   else
    @unique_code = SecureRandom.hex(7)
    Refer.create(user_id: user_id, note_id:note_id, unique_code:@unique_code) if user_id && note_id
   end
   # @note = Note.find(note_id)
   url = "http://54.183.167.119:8000/logdetails/#{@unique_code}/#{log.id}"
   if log.note.contact.emails.first == nil
    render json:  {"errors": "email is not available."} ,status: 404
   else
    UserMailer.share_note(log.note.contact.emails.last.email,log,url).deliver_now
    render json:  {"message": "email sent successfully",data: log} ,status: 201
   end
  else
   render json: { errors: log.errors }, status: 422
  end
 end

 def angular_log_web_page
  log = SharedLog.find(params[:id])
  product = []
  log.note.products.each do |i|
   product.push( i.attributes.merge(:final_price => "%.2f" % i.final_price,:product_image => i.product_image.url))
  end
  render json: {shared_log: log,note: log.note ,photo: log.note.photos,products: product,user: log.note.contact.user,address: log.note.contact.user.addresses}
 end

 private

 def log_params
   params.require(:shared_log).permit(:title,:description,:note_id)
 end
end
