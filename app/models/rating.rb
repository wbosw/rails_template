# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trip_id    :integer
#  user_id    :integer
#
class Rating < ApplicationRecord
  validates :value, presence: true
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :trip, required: true, class_name: "Trip", foreign_key: "trip_id", counter_cache: true

end
