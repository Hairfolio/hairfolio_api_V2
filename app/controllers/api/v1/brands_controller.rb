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
      @post = Post.find(params[:id])      
      @photos = @post.photos
      @description = @post.description
      @image = @photos[0].asset_url

      set_meta_tags title: "Hairfolio App",
      site: "Hair Folio",
      description: @description,
      refresh:5,
      twitter:{
          card: "hairfolio Card",
          site:"hairfolio",
          title: "Posts",
          description:@description,
          image: @image
      },
      og:{
          title: "Hair folio post",
          description: @description,
          type: "Website",
          url: "http://180.211.99.165:8080/jaisal/hairfolio/dist/#/home",
          image: @image
        }
  end

end
