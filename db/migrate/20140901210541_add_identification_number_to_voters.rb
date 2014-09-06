class AddIdentificationNumberToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :IdentificationNumber, :integer
  end
end
