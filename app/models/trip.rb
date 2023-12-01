# == Schema Information
#
# Table name: trips
#
#  id            :integer          not null, primary key
#  city          :string
#  days_count    :integer
#  events_count  :integer
#  private       :boolean
#  public_rating :integer
#  ratings_count :integer
#  user_rating   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class Trip < ApplicationRecord
end
