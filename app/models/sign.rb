class Sign < ActiveRecord::Base
	attr_accessor :type, :beats

	def initialize(type, beats=nil)
		@type = type
		@beats = beats || []
	end

	def beats?(other_sign)
		@beats.include?(other_sign.type)
	end
end
