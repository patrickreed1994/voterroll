class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :FirstName
      t.string :LastName
      t.string :MiddleName

      t.timestamps
    end
  end
end
