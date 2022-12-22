class JobsPublishedSerializer < ActiveModel::Serializer
    attributes :id, :title, :company, :city, :state, :country, :benefits, :created_at, :current_job_type, :description, :experience, :hire_in_country, :job_q, 
    :location_query, :remote, :salary_range, :updated_at, :user_id, :status

    def company
        { 
            id: self.object.company.id,
            name: self.object.company.name,
            desc: self.object.company.description
        }
    end
  end