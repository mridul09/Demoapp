class Author < ApplicationRecord

	validates_presence_of :first_name
	validates_presence_of :last_name
	
	has_and_belongs_to_many :books
end
