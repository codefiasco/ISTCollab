class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :title
      t.text :description
      t.integer :user_id
    end
  end
end
