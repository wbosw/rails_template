# == Schema Information
#
# Table name: days
#
#  id           :integer          not null, primary key
#  date         :date
#  events_count :integer
#  lodging      :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  trip_id      :integer
#
class Day < ApplicationRecord
  belongs_to :trip, required: true, class_name: "Trip", foreign_key: "trip_id", counter_cache: true

  has_many  :events, class_name: "Event", foreign_key: "day_id", dependent: :destroy
  
end
