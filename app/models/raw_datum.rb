class RawDatum < ActiveRecord::Base

  validates :timestamp, :presence => true, :length => { :maximum => 40 }
  validates :status,    :presence => true, :length => { :maximum => 20 }

  default_scope :order => 'raw_data.timestamp DESC'

  def self.process_raw_data
    i = 0
    RawDatum.find_each do |raw|
      data[i] = ProcessedDatum.create
      data[i].period_label = raw.status
      i += 1
    end
    return
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
