class AddCityToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :City, :string
  end
end
