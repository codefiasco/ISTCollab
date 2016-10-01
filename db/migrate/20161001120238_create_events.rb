class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :skills
      t.integer :organization_id
      t.text :description
    end
  end
end
