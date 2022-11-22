class ChangeJobsPublishedTypeName < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs_publisheds, :type, :current_job_type
  end
end
