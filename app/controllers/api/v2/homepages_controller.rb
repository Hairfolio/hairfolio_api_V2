class Api::V2::HomepagesController < ApplicationController
  before_action :check_user
  def index
    #homepages  = Homepage.active
    #homepages  = Homepage.where(status: :active).order(created_at: :ASC)
    homepages  = Homepage.includes(:posts).order('posts.likes_count desc,homepages.id asc').limit(1) if params[:query] == 'trending'
    #homepages  = Homepage.last if params[:query] == 'editor'
    homepages  = Homepage.last if params[:query] == 'editor'
    #where('title_heading ILIKE ?', "%Editors%")
    #likes_count
    #homepages = homepages.page(params[:page]).per(params[:limit])
    #, meta: pagination_dict(homepages)
    #success(data: homepages, user_id: @user_id, status: 200)
    if params[:query] == 'trending'
      render json: homepages[0], user_id: @user_id
    else
      render json: homepages, user_id: @user_id
    end

  end

  def home_trending_and_editor_posts
    id = params[:id]
    homepages  = Homepage.find(id).posts.order(created_at: :ASC).paginate(pagination_params)
    render json: homepages, user_id: @user_id, meta: pagination_dict(homepages)
  end
end