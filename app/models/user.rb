class User < ApplicationRecord
	validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

    has_many :reservations, foreign_key: 'guest_id', class_name: "Reservation"
    has_many :listings, foreign_key: 'admin_id', class_name: "Listing"
end
