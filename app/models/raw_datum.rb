class RawDatum < ActiveRecord::Base

  validates :timestamp, :presence => true, :length => { :maximum => 40 }
  validates :status,    :presence => true, :length => { :maximum => 20 }

  default_scope :order => 'raw_data.timestamp DESC'

  #  RawDatum.find_each(start: 140, batch_size: 30) do |raw|
  # "start: 140" decreases loading time.
  def self.process_raw_data
    data = []
    id = 0
    id2 = 0
    RawDatum.find_each do |raw|
      if raw.status.chomp == "ins Bett gelegt"
        data[id] = ProcessedDatum.create(period_label: "sleep",
                                             begin: raw.timestamp,
                                               end: raw.timestamp)
        id2 = 1
      elsif raw.status.chomp == "noch wach" and id2 == 1
        data[id].begin = Time.parse(raw.timestamp) + 30*60 # 30 min
      elsif raw.status.chomp == "aufgewacht" and id2 == 1
        data[id].end   = raw.timestamp
        id += 1
        id2 = 0
      end
    end
    data
  end

end

# == Schema Information
#
# Table name: raw_data
#
#  id         :integer         not null, primary key
#  timestamp  :text
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#
