class TripsController < ApplicationController
  def index
    matching_trips = Trip.all

    @list_of_trips = matching_trips.order({ :created_at => :desc })

    render({ :template => "trips/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trips = Trip.where({ :id => the_id })

    @the_trip = matching_trips.at(0)

    render({ :template => "trips/show" })
  end

  def create
    the_trip = Trip.new
    the_trip.city = params.fetch("query_city")
    the_trip.user_id = params.fetch("query_user_id")
    the_trip.public_rating = params.fetch("query_public_rating")
    the_trip.private = params.fetch("query_private", false)
    the_trip.user_rating = params.fetch("query_user_rating")
    the_trip.days_count = params.fetch("query_days_count")
    the_trip.events_count = params.fetch("query_events_count")
    the_trip.ratings_count = params.fetch("query_ratings_count")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips", { :notice => "Trip created successfully." })
    else
      redirect_to("/trips", { :alert => the_trip.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.city = params.fetch("query_city")
    the_trip.user_id = params.fetch("query_user_id")
    the_trip.public_rating = params.fetch("query_public_rating")
    the_trip.private = params.fetch("query_private", false)
    the_trip.user_rating = params.fetch("query_user_rating")
    the_trip.days_count = params.fetch("query_days_count")
    the_trip.events_count = params.fetch("query_events_count")
    the_trip.ratings_count = params.fetch("query_ratings_count")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips/#{the_trip.id}", { :notice => "Trip updated successfully."} )
    else
      redirect_to("/trips/#{the_trip.id}", { :alert => the_trip.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.destroy

    redirect_to("/trips", { :notice => "Trip deleted successfully."} )
  end
end
