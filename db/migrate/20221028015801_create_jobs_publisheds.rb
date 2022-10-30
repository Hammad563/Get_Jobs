class CreateJobsPublisheds < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      CREATE TYPE job_type AS ENUM ('Full Time', 'Part Time', 'Co_op', 'On_call');
    SQL
    execute <<-SQL
      CREATE TYPE job_status AS ENUM ('Active', 'Stale', 'Hidden');
    SQL
    
    create_table :jobs_publisheds, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :company
      t.string :title
      t.string :city
      t.string :state
      t.string :country
      t.column :type, :job_type
      t.boolean :remote
      t.string :hire_in_country
      t.integer :experience
      t.text :description
      t.column :status, :job_status
      t.timestamps
    end
  end
end
