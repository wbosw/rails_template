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
end
