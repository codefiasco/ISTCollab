class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :course
      t.string :phone_number
      t.string :email
      t.string :interests
      t.string :skills

      t.string :password_digest
    end
  end
end
