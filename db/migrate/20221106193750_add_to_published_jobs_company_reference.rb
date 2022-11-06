class AddToPublishedJobsCompanyReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs_publisheds, :companies, null: false, foreign_key: true, type: :uuid
  end
end
