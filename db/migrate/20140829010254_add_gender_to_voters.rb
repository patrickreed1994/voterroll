class AddGenderToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :Gender, :string
  end
end
