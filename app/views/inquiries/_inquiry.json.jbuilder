json.extract! inquiry, :id, :id, :hunter_id, :subject, :message, :created_at, :updated_at
json.url inquiry_url(inquiry, format: :json)
