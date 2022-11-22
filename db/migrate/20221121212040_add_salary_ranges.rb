class AddSalaryRanges < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs_publisheds, :salary_range, :integer, array: true, default: []
  end
end
