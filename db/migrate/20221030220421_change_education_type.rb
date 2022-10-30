class ChangeEducationType < ActiveRecord::Migration[7.0]
  def change
    rename_column :educations, :type, :education_type
  end
end
