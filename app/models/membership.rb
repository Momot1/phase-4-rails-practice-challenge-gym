class Membership < ApplicationRecord
    validates :charge, numericality: true
    validate :client_gym_uniqueness
    
    belongs_to :gym
    belongs_to :client

    private

    def client_gym_uniqueness
        if(Gym.find_by(id: gym_id).clients.find_by(id: client_id))
            errors.add(:client_id, "There is already a membership for this client at this gym")
        end
    end
end
