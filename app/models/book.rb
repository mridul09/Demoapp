class Book < ApplicationRecord

	validates_presence_of :book_title, :message => "can't be empty"	
	has_and_belongs_to_many :authors
end
