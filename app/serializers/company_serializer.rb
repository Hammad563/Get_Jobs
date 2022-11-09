class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :approved, :rating, :description, :created_at, :updated_at
end
