class AddMissingAvatars < ActiveRecord::Migration[5.0]
  def up
    add_attachment :events, :avatar
    add_attachment :projects, :avatar
  end

  def down
    remove_attachment :events, :avatar
    remove_attachment :projects, :avatar
  end
end
