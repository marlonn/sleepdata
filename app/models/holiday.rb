class Holiday < ActiveRecord::Base

  default_scope :order => 'date DESC'

  def self.holiday?(timestamp) # expects Date-object
    if Holiday.where(date: Date.parse(timestamp)).any?
      true
    else
      false
    end
  end


end


# == Schema Information
#
# Table name: holidays
#
#  id         :integer         not null, primary key
#  date       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
