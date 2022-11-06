class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name
      t.boolean :approved, default: false
      t.float :rating
      t.string :description
      t.timestamps
    end
    create_join_table(:users, :companies, column_options: { type: :uuid }) do |t|
      t.index :company_id
      t.index :user_id
    end

  end
end
