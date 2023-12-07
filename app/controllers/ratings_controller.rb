class RatingsController < ApplicationController
  def index
    matching_ratings = Rating.all

    @list_of_ratings = matching_ratings.order({ :created_at => :desc })

    render({ :template => "ratings/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ratings = Rating.where({ :id => the_id })

    @the_rating = matching_ratings.at(0)

    render({ :template => "ratings/show" })
  end

  # def create
  #   the_rating = Rating.new
  #   the_rating.user_id = current_user.id
  #   the_rating.value = params.fetch("query_value")
  #   the_rating.trip_id = params.fetch("query_trip_id")

  #   if the_rating.valid?
  #     the_rating.save
  #     redirect_to("/trips/#{the_rating.trip_id}", { :notice => "Rating created successfully." })
  #   else
  #     redirect_to("/ratings", { :alert => the_rating.errors.full_messages.to_sentence })
  #   end
  # end

  def create2
    user_rating = Rating.where({ :user_id => current_user.id }).where({ :trip_id => params.fetch("query_trip_id")}).first
    
    associated_trip = Trip.where({:id => params.fetch("query_trip_id")}).first
  #if the user doing the rating hasnt created a rating for this trip yet
    if user_rating == nil
      the_rating = Rating.new
      the_rating.user_id = current_user.id
      the_rating.value = params.fetch("query_value")
      the_rating.trip_id = params.fetch("query_trip_id")
      
      trip_id = params.fetch("query_trip_id")

      matching_ratings = Rating.where({ :trip_id => trip_id }).where("value IS NOT NULL")
  
      @list_of_ratings = matching_ratings.order({ :created_at => :desc })

      ratings_count = @list_of_ratings.count + 1

      sum_ratings = 0
      @list_of_ratings.each do |a_rating|
        
      sum_ratings = sum_ratings + a_rating.value
      end

      associated_trip.public_rating = ((sum_ratings.to_f + the_rating.value) / ratings_count.to_f).round(1)

      if the_rating.valid?
        the_rating.save
        associated_trip.save
        # associated_trip.save
        redirect_to("/trips/#{the_rating.trip_id}", { :notice => "Rating created successfully." })
      else
        redirect_to("/ratings", { :alert => the_rating.errors.full_messages.to_sentence })
      end
  #if the user has already rated this trip

    else
              
      user_rating.user_id = current_user.id
      user_rating.value = params.fetch("query_value")
      user_rating.trip_id = params.fetch("query_trip_id")
      
      trip_id = params.fetch("query_trip_id")

      matching_ratings = Rating.where({ :trip_id => trip_id }).where.not({ :user_id => current_user.id })
  
      @list_of_ratings = matching_ratings.order({ :created_at => :desc })

      ratings_count = @list_of_ratings.count + 1

      sum_ratings = 0
      @list_of_ratings.each do |a_rating|
        
      sum_ratings = sum_ratings + a_rating.value
      end

      associated_trip.public_rating = ((sum_ratings.to_f + user_rating.value) / ratings_count.to_f).round(1)

      if user_rating.valid?
        user_rating.save
        associated_trip.save

        redirect_to("/trips/#{user_rating.trip_id}", { :notice => "Rating updated successfully." })
      else
        redirect_to("/ratings/#{user_rating.trip_id}", { :alert => user_rating.errors.full_messages.to_sentence })
      end

    end
  end

  def update
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.user_id = params.fetch("query_user_id")
    the_rating.value = params.fetch("query_value")
    the_rating.trip_id = params.fetch("query_trip_id")

    if the_rating.valid?
      the_rating.save
      redirect_to("/ratings/#{the_rating.id}", { :notice => "Rating updated successfully." })
    else
      redirect_to("/ratings/#{the_rating.id}", { :alert => the_rating.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.destroy

    redirect_to("/ratings", { :notice => "Rating deleted successfully." })
  end
end
