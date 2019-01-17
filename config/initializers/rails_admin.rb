RailsAdmin.config do |config|

  config.authorize_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'admin@example.com' && password == 'password'
    end
  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.model Page do
    field :title
    field :slug
    field :content, :ck_editor
  end

  config.model Tag do
    list do
      scopes [:popular, :popular_today, :popular_last_48_hours, :popular_last_7_days, :popular_last_30_days]
    end
  end

  config.model Post do
    edit do
      field :user
      field :description
      field :products
      field :is_trending
      field :is_editors_pic
    end
  end

  config.model ProductGallery do
    edit do
      field :image_url
    end
    visible false
  end


  config.model Cart do
    edit do
      field :user      
      field :products
      field :price
      field :quantity
    end
  end

  config.model Category do
    edit do     
      field :name
      field :position
      field :image      
    end
  end 

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['Cart', 'Order', 'OrderDetail']
    end
    export
    bulk_delete
    show
    edit do
      except ['Cart']
    end
    delete
    show_in_app do
      except ['Cart']
    end
    import
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
    
end
