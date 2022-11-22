class GetRidOfCompanyNameOnJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs_publisheds, :company
  end
end
