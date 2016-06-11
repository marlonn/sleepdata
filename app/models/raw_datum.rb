# endcoding: utf-8

class RawDatum < ActiveRecord::Base

  validates :timestamp, :presence => true, :length => { :maximum => 40 }
  validates :status,    :presence => true, :length => { :maximum => 20 }

  default_scope :order => 'raw_data.timestamp DESC'

  #  RawDatum.find_each(start: 140, batch_size: 30) do |raw|
  # "start: 140" decreases loading time.
  # Time.parse(raw.timestamp).to_s - time needs to in same format as values
  # with added minutes
  def self.process_raw_data
    data = []
    id = 0
    can_edit = false
    RawDatum.find_each(start: 0) do |raw|
      if raw.status.chomp == "ins Bett gelegt"
        data[id]     = ProcessedDatum.new(period_label: "laying awake",
                                begin: Time.parse(raw.timestamp).to_s,
                                  end: (Time.parse(raw.timestamp) + 30*60).to_s)
        data[id + 1] = ProcessedDatum.new(period_label: "sleeping",
                                begin: (Time.parse(raw.timestamp) + 30*60).to_s,
                                  end: Time.parse(raw.timestamp).to_s)
        can_edit = true
      elsif raw.status.chomp == "noch wach" and can_edit == true
        data[id].end        = (Time.parse(raw.timestamp) + 30*60).to_s
        data[id + 1].begin  = (Time.parse(raw.timestamp) + 30*60).to_s
      elsif raw.status.chomp == "aufgewacht" and can_edit == true
        data[id + 1].end    = Time.parse(raw.timestamp).to_s
        id += 2
        can_edit = false
      end
    end
    can_edit = false
    RawDatum.find_each(start: 130) do |raw|
      if raw.status.chomp == "aufgewacht"
        data[id] = ProcessedDatum.new(period_label: "laying awake",
                                             begin: raw.timestamp,
                                               end: raw.timestamp)
        can_edit = true
      elsif raw.status.chomp == "aufgestanden" and can_edit == true
        data[id].end = raw.timestamp
        id += 1
        can_edit = false
      end
    end
    data.sort! { |a,b| b.begin.to_s <=> a.begin.to_s }
    data.each { |datum| datum.save }
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
