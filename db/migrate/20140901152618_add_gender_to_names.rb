class AddGenderToNames < ActiveRecord::Migration
  def change
    add_column :names, :Gender, :string
  end
end
