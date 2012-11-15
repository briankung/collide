class VotesController < ApplicationController
	before_filter :load_votable
	def up
		vote_status = current_hero.voted_as_when_voted_for(@votable)

		case vote_status
		when true 	# BK: When previously upvoted
			@votable.unvote voter: current_hero
		when false	# BK: ~ downvoted
			@votable.liked_by current_hero
		else		# BK: Not previously voted on
			@votable.liked_by current_hero
		end

		redirect_to (root_url.to_s + request.path.split('/')[1])
	end

	def down
		vote_status = current_hero.voted_as_when_voted_for(@votable)

		case vote_status
		when true 	# BK: When previously upvoted
			@votable.disliked_by current_hero
		when false	# BK: ~ downvoted
			@votable.unvote voter: current_hero
		else		# BK: Not previously voted on
			@votable.disliked_by current_hero
		end

		redirect_to (root_url.to_s + request.path.split('/')[1])
	end
end