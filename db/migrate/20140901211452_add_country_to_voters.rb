class AddCountryToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :Country, :string
  end
end
