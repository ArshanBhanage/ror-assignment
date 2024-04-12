json.extract! patient, :id, :first_name, :last_name, :dob, :gender, :address, :phone, :email, :created_at, :updated_at
json.url patient_url(patient, format: :json)
