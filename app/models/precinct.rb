class Precinct < ActiveRecord::Base
  require 'CSV'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      precinct_hash = row.to_hash
      precinct = Segment.where(id: precinct_hash["id"])

      if precinct.count == 1
        precinct.first.update_attributes(precinct_hash)
      else
        Precinct.create!(precinct_hash)
      end # end if !precinct.nil?
    end # end CSV.foreach
  end # end self.import(file)
end #end class
