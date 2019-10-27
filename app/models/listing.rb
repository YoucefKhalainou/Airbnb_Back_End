class Listing < ApplicationRecord
	
	validates :available_beds, 
	:numericality => {:greater_than => 0},
	presence: true

	validates :price,
    :numericality => {:greater_than => 0},
	presence: true

	validates :description,
	presence: true,
	length: { minimum: 140 }
	
	validates :welcome_message,
	presence: true

	belongs_to :admin, class_name: "User"
	belongs_to :city
	has_many :reservations

end
