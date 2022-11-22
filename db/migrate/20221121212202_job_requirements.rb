class JobRequirements < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs_publisheds, :job_q, :text
    add_column :jobs_publisheds, :benefits, :string, array: true, default: []
  end
end
