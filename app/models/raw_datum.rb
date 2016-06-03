class RawDatum < ActiveRecord::Base

  validates :timestamp, :presence => true, :length => { :maximum => 40 }
  validates :status,    :presence => true, :length => { :maximum => 20 }

  default_scope :order => 'raw_data.timestamp DESC'

  def self.process_raw_data
    data = []
    RawDatum.find_each(start: 140, batch_size: 30) do |raw|
      data << ProcessedDatum.create(period_label: raw.status,
                                           begin: raw.timestamp,
                                             end: raw.timestamp)
    end
    return data
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
