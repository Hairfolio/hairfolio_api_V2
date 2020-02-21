class Api::V2::BrandsController < ApplicationController
  before_action :check_user
 
  def index
    brands =
      if params["service_id"]
        Service.find(params[:service_id]).brands
      else
        Brand.all
      end
    all_brands =  brands.page(params[:page]).per(params[:limit])
    render json: all_brands, includes: [:services], meta: pagination_dict(all_brands)
  end

  def show
    render json: Brand.find(params[:id])
  end

  #Post Apis  
  def all_posts     

      if @user_id.present?
        path =  Rails.root.join("public", "post_log_#{@user_id}.txt")
        if ! File.file?(path)
          File.open(path, "w+")
          #path =  Rails.root.join("public", "post_log_#{@user_id}.txt")
        end
      else
        path = Rails.root.join("public", "post_log.txt") #{}"/public/post_log.txt"
      end


      start_time = Time.current;
      start_api =  " \n ----------------Start All Post-------------------\nStart Api :  #{Time.current}  : Get App All Post \n"
      File.write(path, start_api, mode: 'a')

      posts = Post.all
      posts = posts.order(updated_at: :desc).page(params[:page]).per(params[:limit])  
      
      record_json = {json: posts, user_id: @user_id, meta: pagination_dict(posts)}.to_json

      end_api =  "\n --------------- Response data ----------------------: \n End time : #{Time.current}: \n \n  #{record_json}  : \n ----------------END All Post--------===> Total time #{(Time.current - start_time)} -----------\n "
      File.write(path, end_api, mode: 'a')

      render json: posts, user_id: @user_id, meta: pagination_dict(posts)

       
  end

  def trendings
    @posts = Post.where(is_trending: true).paginate(pagination_params)
    render json: @posts, user_id: @user_id, meta: pagination_dict(@posts)
  end

  def editor_pics
    @posts = Post.where(is_editors_pic: true)
    render json: @posts, user_id: @user_id
  end

end
