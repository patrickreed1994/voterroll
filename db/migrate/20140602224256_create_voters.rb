class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :FirstName
      t.string :MiddleName
      t.string :LastName
      t.integer :PrecinctUID
      t.string :PrecinctName
      t.integer :HouseNumber
      t.string :StreetName
      t.string :StreetSuffix
      t.string :StreetDirection

      t.timestamps
    end
  end
end
