class LandingController < ApplicationController
    def index
        render json: { message: "Welcome to Get Job API" }, status: 200
    end
end