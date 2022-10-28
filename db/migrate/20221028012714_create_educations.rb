class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :school
      t.string :type
      t.string :major
      t.decimal :gpa, :precision => 11, :scale => 2
      t.date :grad_date
      t.timestamps
    end
  end
end
