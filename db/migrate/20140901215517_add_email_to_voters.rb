class AddEmailToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :Email, :string
  end
end
