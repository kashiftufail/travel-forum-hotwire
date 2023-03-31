json.extract! product, :id, :name, :number, :category_id, :price, :quantity_in_hand, :detail, :size, :created_at, :updated_at
json.url product_url(product, format: :json)
