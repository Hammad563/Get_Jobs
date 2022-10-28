class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      CREATE TYPE category_role AS ENUM ('Engineer', 'Design', 'Operations', 'Product', 'Management');
    SQL
    create_table :roles, id: :uuid do |t|
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.column :category, :category_role
      
      t.timestamps
    end
  end
end
