class AddLocalityNameToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :LocalityName, :string
  end
end
