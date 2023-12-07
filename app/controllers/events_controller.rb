class EventsController < ApplicationController
  def index
    matching_events = Event.all

    @list_of_events = matching_events.order({ :created_at => :desc })

    render({ :template => "events/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_events = Event.where({ :id => the_id })

    @the_event = matching_events.at(0)

    render({ :template => "events/show" })
  end

  def create
    the_event = Event.new
    the_event.name = params.fetch("query_name")
    the_event.day_id = params.fetch("query_day_id")
    the_event.notes = params.fetch("query_notes")
    the_event.trip_id = params.fetch("query_trip_id")
    # the_event.time = params.fetch("query_time")

    if the_event.valid?
      the_event.save
      redirect_to("/trips/#{the_event.trip_id}/days/#{the_event.day_id}", { :notice => "Event created successfully." })
    else
      redirect_to("/trips/#{the_event.trip_id}/days/#{the_event.day_id}", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.name = params.fetch("query_name")
    the_event.day_id = params.fetch("query_day_id")
    the_event.notes = params.fetch("query_notes")
    the_event.trip_id = params.fetch("query_trip_id")
    # the_event.time = params.fetch("query_time")

    if the_event.valid?
      the_event.save
      redirect_to("/events/#{the_event.id}", { :notice => "Event updated successfully."} )
    else
      redirect_to("/events/#{the_event.id}", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    trip_id = the_event.trip.id

    the_event.destroy

    redirect_to("/trips//#{trip_id}", { :notice => "Event deleted successfully."} )
  end
end
