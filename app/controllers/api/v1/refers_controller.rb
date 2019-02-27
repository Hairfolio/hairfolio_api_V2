class Api::V1::RefersController < ApplicationController
	before_action :check_user
  	require "base64"

	#Meta tags Api
  	def view_post_meta
	    @unique_code = SecureRandom.hex(7)
	    # if Refer.exists?(user_id: @user_id,post_id: params[:id])
	    # 	render json: 8888
	    # else
	    # 	render json: 0000
	    # end
	    # Refer.create(user_id: @user_id, post_id:params[:id], unique_code:@unique_code) if @user_id && params[:id]	    

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
