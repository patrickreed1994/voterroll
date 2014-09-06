class AddOver18ToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :Over18, :integer
  end
end
