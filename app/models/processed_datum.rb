class ProcessedDatum < ActiveRecord::Base

  #validates :begin,       :presence => true, :length => { :maximum => 40 }
  #validates :end,         :presence => true, :length => { :maximum => 40 }
  #validates :period_label, :presence => true, :length => { :maximum => 20 }

  default_scope :order => 'processed_data.begin DESC'

  def duration_in_minutes
    (Time.parse(self.end) - Time.parse(self.begin)) / 60
  end

  # this doesnt seem to work.
  def self.wipe_db
    ProcessedDatum.delete_all
  end

end

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

