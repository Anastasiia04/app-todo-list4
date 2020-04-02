# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  completed  :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :user

  scope :complete, -> { where(:completed => true)}
  scope :incomplete, -> { where(:completed => false)}
end
