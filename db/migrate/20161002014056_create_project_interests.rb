class CreateProjectInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :project_id
    end
  end
end
