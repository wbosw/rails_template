Rails.application.routes.draw do
  get("/", controller: "test", action: "show")
end
