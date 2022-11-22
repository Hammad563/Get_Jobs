class SetDefaultJobStatusToHidden < ActiveRecord::Migration[7.0]
  def up
    change_column_default :jobs_publisheds, :status, "Hidden"
  end
  def down
    change_column_default :jobs_publisheds, :status, nil
  end
end
