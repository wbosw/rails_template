# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  notes      :string
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  day_id     :integer
#  trip_id    :integer
#
class Event < ApplicationRecord
end
