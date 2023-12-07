# == Schema Information
#
# Table name: trips
#
#  id            :integer          not null, primary key
#  city          :string
#  days_count    :integer
#  events_count  :integer
#  private       :boolean
#  public_rating :float
#  ratings_count :integer
#  user_rating   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class Trip < ApplicationRecord
  validates :city, presence: true

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true

  has_many  :days, class_name: "Day", foreign_key: "trip_id", dependent: :destroy

  has_many  :events, class_name: "Event", foreign_key: "trip_id", dependent: :destroy

  has_many  :ratings, class_name: "Rating", foreign_key: "trip_id", dependent: :destroy

end
