# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  notes      :string
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  day_id     :integer
#  trip_id    :integer
#
class Event < ApplicationRecord
  belongs_to :trip, required: true, class_name: "Trip", foreign_key: "trip_id", counter_cache: true

  belongs_to :day, required: true, class_name: "Day", foreign_key: "day_id", counter_cache: true
end
