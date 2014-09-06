class AddPhoneToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :Phone, :string
  end
end
