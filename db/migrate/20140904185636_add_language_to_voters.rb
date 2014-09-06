class AddLanguageToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :Language, :string
  end
end
