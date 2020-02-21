module Products
  class ProductImport
    attr_accessor :file

    def initialize(file:)
      @file = file
    end

    def apply
      CSV.foreach(file.path, headers: true) do |row|
        product_hash = row.to_hash
        value = ["Name","New arrival","Price", "Quantity","Is trending","Short description",
                 "Description","Product image","Name [Collection]","Name [Shampoo]",
                 "Name [Conditioner]","Name [Styling product]","Title [Product brand]",
                 "Image url [Product galleries]","Name [Product types]","Name [Hair types]",
                 "Name [Ingredients]","Name [Preferences]","Name [Consistency types]",
                 "Name [Styling tools]"]

        if (product_hash.keys - value).empty?
          product = Product.where(name: product_hash["Name"])

          unless product.present?
            unless product_hash["Name [Collection]"].nil?
              collection = Collection.find_by_name(product_hash["Name [Collection]"])
              if collection.present?
                collection
              else
                collection = Collection.create(name: product_hash["Name [Collection]"])
              end
            end

            unless product_hash["Name [Shampoo]"].nil?
              shampoo = Shampoo.find_by_name(product_hash["Name [Shampoo]"])
              if shampoo.present?
                shampoo
              else
                shampoo = Shampoo.create(name: product_hash["Name [Shampoo]"])
              end
            end

            unless product_hash["Name [Conditioner]"].nil?
              conditioner = Conditioner.find_by_name(product_hash["Name [Conditioner]"])
              if conditioner.present?
                conditioner
              else
                conditioner = Conditioner.create(name: product_hash["Name [Conditioner]"])
              end
            end

            unless product_hash[ "Name [Styling product]"].nil?
              styling_product = StylingProduct.find_by_name(product_hash["Name [Styling product]"])
              if styling_product.present?
                styling_product
              else
                styling_product = StylingProduct.create(name: product_hash["Name [Styling product]"])
              end
            end

            unless product_hash["Title [Product brand]"].nil?
              product_brand = ProductBrand.find_by_title(product_hash["Title [Product brand]"])
              if product_brand.present?
                product_brand
              else
                product_brand = ProductBrand.create(title: product_hash["Title [Product brand]"],
                                                    remote_image_url: "https://d23qi8xb3q5mph.cloudfront.net/post/11558905_hf_imagedisplay.png")
              end
            end

            product = Product.create(name: product_hash["Name"],
                                     new_arrival: product_hash["New arrival"],
                                     price: product_hash["Price"],
                                     quantity: product_hash["Quantity"],
                                     is_trending: product_hash["Is trending"],
                                     short_description: product_hash["Short description"],
                                     description: product_hash["Description"],
                                     remote_product_image_url: product_hash["Product image"].present? ? product_hash["Product image"] : "https://d23qi8xb3q5mph.cloudfront.net/post/11558905_hf_imagedisplay.png",
                                     collection_id: collection.nil? ? nil : collection.id,
                                     shampoo_id: shampoo.nil? ? nil : shampoo.id,
                                     conditioner_id: conditioner.nil? ? nil : conditioner.id,
                                     styling_product_id: styling_product.nil? ? nil : styling_product.id,
                                     product_brand_id: product_brand.nil? ? nil : product_brand.id,
                                     )

            unless product_hash["Image url [Product galleries]"].nil?
              images = product_hash["Image url [Product galleries]"].split(',')
              images.each do |image|
                ProductGallery.create(product_id: product.id,remote_image_url_url: image) unless product.id.nil?
              end
            end

            unless product_hash["Name [Product types]"].nil?
              product_type = product_hash["Name [Product types]"].split(',')
              product_type.each do |product|
                product_type = ProductType.find_by_name(product)
                ProductType.create(name: product) unless product_type.present?
              end
            end

            unless product_hash["Name [Hair types]"].nil?
              hair_type = product_hash["Name [Hair types]"].split(',')
              hair_type.each do |hair|
                hair_type = HairType.find_by_name(hair)
                HairType.create(name: hair) unless hair_type.present?
              end
            end

            unless product_hash["Name [Ingredients]"].nil?
              ingredients = product_hash["Name [Ingredients]"].split(',')
              ingredients.each do |ingredient|
                ingredients = Ingredient.find_by_name(ingredient)
                Ingredient.create(name: ingredient) unless ingredients.present?
              end
            end

            unless product_hash["Name [Preferences]"].nil?
              preferences = product_hash["Name [Preferences]"].split(',')
              preferences.each do |preference|
                preferences = Preference.find_by_name(preference)
                Preference.create(name: preference) unless preferences.present?
              end
            end

            unless product_hash["Name [Consistency types]"].nil?
              consistency_type = product_hash["Name [Consistency types]"].split(',')
              consistency_type.each do |consistency|
                consistency_type = ConsistencyType.find_by_name(consistency)
                ConsistencyType.create(name: consistency) unless consistency_type.present?
              end
            end

            unless product_hash["Name [Styling tools]"].nil?
              styling_tool = product_hash["Name [Styling tools]"].split(',')
              styling_tool.each do |styling|
                styling_tool = StylingTool.find_by_name(styling)
                StylingTool.create(name: styling) unless styling_tool.present?
              end
            end
          end
        else
          return "error"
        end
      end
      return "success"
    end
  end
end