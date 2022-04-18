class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def destroy
        Gym.find(params[:id]).destroy
        render json: {}, status: :no_content
    end

    private

    def record_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end
end
