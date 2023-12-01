Rails.application.routes.draw do

  root "trips#index"


  # Routes for the Trip resource:

  # CREATE
  post("/insert_trip", { :controller => "trips", :action => "create" })
          
  # READ
  get("/trips", { :controller => "trips", :action => "index" })
  
  get("/trips/:path_id", { :controller => "trips", :action => "show" })
  
  # UPDATE
  
  post("/modify_trip/:path_id", { :controller => "trips", :action => "update" })
  
  # DELETE
  get("/delete_trip/:path_id", { :controller => "trips", :action => "destroy" })

  # Routes for the Rating resource:

  # CREATE
  post("/insert_rating", { :controller => "ratings", :action => "create" })
          
  # READ
  get("/ratings", { :controller => "ratings", :action => "index" })
  
  get("/ratings/:path_id", { :controller => "ratings", :action => "show" })
  
  # UPDATE
  
  post("/modify_rating/:path_id", { :controller => "ratings", :action => "update" })
  
  # DELETE
  get("/delete_rating/:path_id", { :controller => "ratings", :action => "destroy" })

  #------------------------------

  # Routes for the Event resource:

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })
  
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # Routes for the Day resource:

  # CREATE
  post("/insert_day", { :controller => "days", :action => "create" })
          
  # READ
  get("/days", { :controller => "days", :action => "index" })
  
  get("/days/:path_id", { :controller => "days", :action => "show" })
  
  # UPDATE
  
  post("/modify_day/:path_id", { :controller => "days", :action => "update" })
  
  # DELETE
  get("/delete_day/:path_id", { :controller => "days", :action => "destroy" })

  #------------------------------



  #------------------------------

  devise_for :users

  get("/test", controller: "test", action: "show")
end
