class Terms < ActiveRecord::Base
	attr_accessible :terms
	validates :terms, :acceptance => true
end

