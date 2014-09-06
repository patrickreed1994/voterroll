class Segment < ActiveRecord::Base
  require 'CSV'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      segment_hash = row.to_hash
      segment = Segment.where(id: segment_hash["id"])

      if segment.count == 1
        segment.first.update_attributes(segment_hash)
      else
        Segment.create!(segment_hash)
      end # end if !segment.nil?
    end # end CSV.foreach
  end # end self.import(file)
end #end class
