class CreateWorkExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :work_experiences, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :company
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :current_work
      t.text :description
      t.timestamps
    end
  end
end
