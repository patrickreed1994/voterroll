class CreatePrecincts < ActiveRecord::Migration
  def change
    create_table :precincts do |t|
      t.integer :PrecinctUID
      t.string :PrecinctName

      t.timestamps
    end
  end
end
