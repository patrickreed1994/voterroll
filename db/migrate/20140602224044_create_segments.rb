class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.integer :StSegUID
      t.integer :StartHouseNumber
      t.integer :EndHouseNumber
      t.string :OddEvenBoth
      t.string :StreetDirection
      t.string :StreetName
      t.string :StreetSuffix
      t.integer :PrecinctUID

      t.timestamps
    end
  end
end
