class JobsPublished < ApplicationRecord
  belongs_to :user
  belongs_to :company, optional: true

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def as_indexed_json(_options = {})
    JobsPublishedDenormalizer.new(self).to_hash
  end

  settings index: { number_of_shards: 1} do
    mapping dynamic: 'false' do
      indexes :id
      indexes :user_id
      indexes :title
      indexes :city, type: :keyword
      indexes :state, type: :keyword
      indexes :country, type: :keyword
      indexes :current_job_type, type: :keyword
      indexes :remote, type: :boolean
      indexes :hire_in_country, type: :keyword
      indexes :description
      indexes :status, type: :keyword
      indexes :created_at, type: :date, format: :date_optional_time
      indexes :updated_at, type: :date, format: :date_optional_time
      indexes :company_id
      indexes :location_query, type: :keyword
      indexes :salary_range, type: :object
      indexes :job_q, type: :object
      indexes :benefits, type: :object

      indexes :company_name




    end
  end

  def self.search(query)
    params = {
      query: {
        bool: {
          must: [
            {
              multi_match: {
                query: query, 
                fields: [ :title, :job_q, :company_name ] 
              }
            },
            { 
              match: {
                status: "Active"
              }
            }
          ]
        }
      },
      sort: [
        { 
          created_at: {order: :desc}
         }
      ]
    }  
    self.__elasticsearch__.search(params)
  end


end
