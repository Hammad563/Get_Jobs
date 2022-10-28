class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :country
      t.string :state
      t.string :city
      t.integer :experience, default: -1
      t.text :bio
      t.string :url
      t.string :linked_in
      t.string :github
      t.text :achievements
      
      t.timestamps
    end
  end
end
