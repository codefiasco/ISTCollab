class AddTimestampsProjects < ActiveRecord::Migration[5.0]
  def change_table
    add_timestamps(:users)
  end
end
