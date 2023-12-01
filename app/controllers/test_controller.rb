class TestController < ApplicationController
  def show
    render(template: "test/show")
  end
end
