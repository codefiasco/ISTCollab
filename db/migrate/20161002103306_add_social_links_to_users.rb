class AddSocialLinksToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users , :github_link , :string
    add_column :users , :linkedin_link , :string
  end
end
