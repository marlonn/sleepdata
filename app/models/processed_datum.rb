class ProcessedDatum < ActiveRecord::Base

  #validates :begin,       :presence => true, :length => { :maximum => 40 }
  #validates :end,         :presence => true, :length => { :maximum => 40 }
  #validates :period_label, :presence => true, :length => { :maximum => 20 }

  default_scope :order => 'processed_data.begin DESC'

def self.process_raw_data
  i = 0

  data[0] = ProcessedDatum.create
  @processed_data = RawDatum.find_each do |raw|
    data[i] = ProcessedDatum.create
    data[i].period_label = raw.status
    i += 1
  end
  return @processed_data
end

  # def self.process_raw_datum(raw)
  #   @processed_datum = ProcessedDatum.new
  #   # @processed_datum.begin  = RawDatum.find_by_id(id).timestamp
  #   # @processed_datum.end    = RawDatum.find_by_id(id).timestamp
  #   # @processed_datum.period_label = RawDatum.find_by_id(id).status
  #   @processed_datum.begin  = raw.timestamp
  #   @processed_datum.end    = raw.timestamp
  #   @processed_datum.period_label = raw.status
  #   return @processed_datum
  # end
  #
  # def self.process_raw_data
  #   i=0
  #   raw_datum = RawDatum.all
  #   raw_datum.each do |raw|
  #     data[i] = ProcessedDatum.process_raw_datum(raw)
  #     i++
  #   end
  #   return data
  # end




# == Schema Information
#
# Table name: processed_data
#
#  id           :integer         not null, primary key
#  period_label :string(255)
#  begin        :string(255)
#  end          :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
end
