class Holiday < ActiveRecord::Base

  default_scope :order => 'date DESC'

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
