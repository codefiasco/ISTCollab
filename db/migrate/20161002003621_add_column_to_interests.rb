class AddColumnToInterests < ActiveRecord::Migration[5.0]
  def change
    add_column :interests , :project_id , :integer
  end
end
