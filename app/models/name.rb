class Name < ActiveRecord::Base
  require 'CSV'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      name_hash = row.to_hash
      name = Segment.where(id: name_hash["id"])

      if name.count == 1
        name.first.update_attributes(name_hash)
      else
        Name.create!(name_hash)
      end # end if !name.nil?
    end # end CSV.foreach
  end # end self.import(file)
end #end class

