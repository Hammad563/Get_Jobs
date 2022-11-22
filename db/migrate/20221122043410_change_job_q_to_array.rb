class ChangeJobQToArray < ActiveRecord::Migration[7.0]
  def up
    change_table :jobs_publisheds do |t|
      t.change :job_q, :string, array: true, default: [], using: "(string_to_array(job_q, ','))"
    end
  end
  def down
    change_table :jobs_publisheds do |t|
      t.change :job_q, :text
    end
  end
end
