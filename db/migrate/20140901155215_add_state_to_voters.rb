class AddStateToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :State, :string
  end
end
