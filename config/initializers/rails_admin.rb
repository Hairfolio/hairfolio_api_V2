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

  config.model Product do
    edit do
      field :name do
        required true
        html_attributes do
          { :minlength => 3 }
        end
      end
      field :product_image do
        required true
      end
      field :price do
        required true
      end
      field :quantity do
        required true
      end
      field :description do
        required true
      end
      field :short_description do
        required true
      end
      field :favourites_count do
        read_only true
      end
      field :categories do
        partial 'categories'
      end
      include_all_fields
      exclude_fields :favourites, :posts, :tag, :favourites_count
    end
  end

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
      field :image_url do
        label "Upload Image"
      end
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
      field :name do
        required true
      end
      field :image do 
        required true
      end
      
      field :parent_id, :enum do
        enum_method do
          :parent_enum
        end
      end
    end
    nestable_tree({
      position_field: :position,
      max_depth: 2
    })
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['Cart', 'Order', 'OrderDetail', 'Refer']
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
    nestable
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
    
end
