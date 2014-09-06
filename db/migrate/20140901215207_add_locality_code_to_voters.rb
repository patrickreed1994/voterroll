class AddLocalityCodeToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :LocalityCode, :integer
  end
end
