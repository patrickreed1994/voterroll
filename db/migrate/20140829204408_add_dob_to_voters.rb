class AddDobToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :DOB, :string
  end
end
