class Reservation < ApplicationRecord
	
	validates :start_date, :presence => { :message => "must be a valid date/time" }
    validates :end_date, :presence => {:message => "must be a valid date/time"}
  	validate :start_must_be_before_end_date
  	validate :overlaping_reservation?
  	
  	belongs_to :guest, class_name: "User"
    belongs_to :listing


  	def start_must_be_before_end_date
    	errors.add(:start_date, "must be before end date") unless
    	start_date < end_date
    	end
  	end  
  
   	def overlaping_reservation?

    	overlaps = false

    	Reservation.where("listing_id = ?", listing_id).find_each do |reservation|  
      	
        if conflict?(reservation)
      	overlaps = true 
    	end

   		if overlaps
   		errors.add(:start_date, "Can not create a reservation that overlaps with others on this listing")
   		end 

  	end

  	def conflict?(reservation_listing)

    	if (start_date < reservation_listing.start_date && end_date < reservation_listing.start_date ) || (start_date > reservation_listing.end_date && end_date > reservation_listing.end_date)
      		return false
    	else
      		return true
    	end

  	end

end
