json.extract! factura, :id, :created_at, :updated_at
json.url factura_url(factura, format: :json)
