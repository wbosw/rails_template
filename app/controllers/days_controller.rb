class DaysController < ApplicationController
  # def index
  #   matching_days = Day.all

  #   @list_of_days = matching_days.order({ :created_at => :desc })

  #   render({ :template => "days/index" })
  # end

  def show
    the_id = params.fetch("path_id")

    matching_days = Day.where({ :id => the_id })

    @the_day = matching_days.at(0)

    render({ :template => "days/show" })
  end

  def create
    the_day = Day.new
    the_day.trip_id = params.fetch("query_trip_id")
    the_day.date = params.fetch("query_date")
    the_day.name = params.fetch("query_name")
    the_day.lodging = params.fetch("query_lodging")
    
    @the_trip = params.fetch("query_trip_id")

    if the_day.valid?
      the_day.save
      redirect_to("/trips/:path_id/days", { :notice => "Day created successfully." })
    else
      redirect_to("/days", { :alert => the_day.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_day = Day.where({ :id => the_id }).at(0)

    the_day.trip_id = params.fetch("query_trip_id")
    the_day.date = params.fetch("query_date")
    the_day.name = params.fetch("query_name")
    the_day.lodging = params.fetch("query_lodging")
    the_day.events_count = params.fetch("query_events_count")

    if the_day.valid?
      the_day.save
      redirect_to("/days/#{the_day.id}", { :notice => "Day updated successfully."} )
    else
      redirect_to("/days/#{the_day.id}", { :alert => the_day.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_day = Day.where({ :id => the_id }).at(0)

    the_day.destroy

    redirect_to("/days", { :notice => "Day deleted successfully."} )
  end
end
