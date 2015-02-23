class GameController < ApplicationController
	 SIGN_CHOICES = %w[rock paper scissors]

	SIGNS = {
		'rock' => Sign.new('rock', ['scissors']),
		'paper' => Sign.new('paper', ['rock']),
		'scissors' => Sign.new('scissors', ['paper']),
	}

	def index
		@signs = signs
	end

	def throw
		if params[:sign] && signs.include?(params[:sign])
			@user_throw = params[:sign]
			@server_throw = signs.sample
			@result = compare(@user_throw, @server_throw)
		else
			Rails.logger.debug "Invalid sign choice passed: #{params[:sign]}"
			render :file => 'public/500.html', :status => 500
		end
	end

	private

	def compare(user_throw, server_throw)
		return 'tie' if user_throw == server_throw

		SIGNS[user_throw].beats?(SIGNS[server_throw]) ? (return 'win') : ( return 'lose')
	end

	def signs
		SIGNS.keys
	end
end
