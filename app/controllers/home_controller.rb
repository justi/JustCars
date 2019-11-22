class HomeController < ApplicationController
  def index
    render json: {
      jsonapi: {
        version: "1.0"
      },
      meta: {
        description: "List of available endpoints",
        resources: {
          offers: offers_url
        }
      },
      links: {
        self: root_url
      }
    }
  end
end
