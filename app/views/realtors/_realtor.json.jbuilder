json.extract! realtor, :id, :email, :name, :password, :company_id, :phone, :created_at, :updated_at
json.url realtor_url(realtor, format: :json)
