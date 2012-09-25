class Reservation < ActiveRecord::Base
  attr_accessible :date, :museum, :num_of_people
	belongs_to :user
	validates :date, :presence => true, :format => {with: /\d{2}-\d{2}-\d{4}/,message: "date must be in this shape: dd-mm-aaaa"}
	validates :museum, :presence => true
	validates :num_of_people, :presence => true, :numericality => { :only_integer => true , greater_than: 0 }
end
