class Api::V1::RefersController < ApplicationController
	before_action :check_user  	

	#Meta tags Api
  	def view_post_meta	    
	    if Refer.exists?(user_id: @user_id,post_id: params[:id])
	    	@unique_code = Refer.where(user: @user_id).where(post_id: params[:id]).map(&:unique_code)[0]	
	    else
	    	@unique_code = SecureRandom.hex(7)
	    	Refer.create(user_id: @user_id, post_id:params[:id], unique_code:@unique_code) if @user_id && params[:id]	    	
	    end

	    @post = Post.find(params[:id])
	    @photos = @post.photos
	    @description = @post.description
	    @image = @photos[0].asset_url

	    set_meta_tags description: @description,
	    refresh:5,                    
	    og:{
	      title: @description,
	      description: @description,
	      type: "website",
	      url: "",
	      image:@image
	    }

	end 

end
