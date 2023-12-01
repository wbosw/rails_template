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
end
