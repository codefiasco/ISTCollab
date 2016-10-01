class CreateProject < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :category
      t.string :skills
      t.integer :user_id
      t.text :description
    end
  end
end
