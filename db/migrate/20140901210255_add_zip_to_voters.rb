class AddZipToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :ZIP, :integer
  end
end
