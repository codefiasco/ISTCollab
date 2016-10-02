class AddInterestToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects , :interests , :string
  end
end
