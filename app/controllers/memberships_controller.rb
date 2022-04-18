class MembershipsController < ApplicationController
    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def  membership_params
        params.permit(:gym_id, :client_id, :charge)
    end
end
