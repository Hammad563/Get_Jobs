class AddLocationQueryToJobsPublished < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs_publisheds, :location_query, :string
  end
end
