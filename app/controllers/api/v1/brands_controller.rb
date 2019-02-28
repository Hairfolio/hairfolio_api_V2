class Api::V1::BrandsController < ApplicationController  
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
      posts = Post.all
      posts = posts.order(updated_at: :desc).page(params[:page]).per(params[:limit])    
      render json: posts, user_id: @user_id, meta: pagination_dict(posts)
  end

  def trendings
    @posts = Post.where(is_trending: true)
    render json: @posts, user_id: @user_id
  end

  def editor_pics
    @posts = Post.where(is_editors_pic: true)
    render json: @posts, user_id: @user_id
  end

  def view_post_meta
    @unique_code = Base64.encode64(params[:id].to_s+','+@user_id.to_s)
    #enc = Base64.decode64(unique_code)
    # render json: enc.split(",")[1];

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
                      url: request.base_url+"/view_post/"+params[:id],
                      image:@image
                    }
                    # twitter:{
                    #     card: "photo",
                    #     site:"http://hairfolio-prod.herokuapp.com",
                    #     title: @description,
                    #     description:@description,
                    #     image: {
                    #       url: @image,
                    #       width:  "300px",
                    #       height: "300px"
                    #     }
                    # }
  end

  def view_post
    render json: params[:id]
  end
end
