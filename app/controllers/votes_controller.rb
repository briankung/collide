class VotesController < ApplicationController
	def up
		vote = @voteable.votes.find_by_hero_id(current_hero.id)

		if vote
			vote.value <= 0 ? vote.value = 1 : vote.value = 0
			vote.save

			redirect_to polymorphic_path(@voteable.class.to_s.downcase.pluralize)
		else
			vote = @voteable.votes.new
			vote.value = 1
			vote.hero_id = current_hero.id
			vote.save

			redirect_to polymorphic_path(@voteable.class.to_s.downcase.pluralize)
		end
	end

	def down
		vote = @voteable.votes.find_by_hero_id(current_hero.id)

		if vote
			vote.value >= 0 ? vote.value = -1 : vote.value = 0
			vote.save

			redirect_to polymorphic_path(@voteable.class.to_s.downcase.pluralize)
		else
			vote = @voteable.votes.new
			vote.value = -1
			vote.hero_id = current_hero.id
			vote.save

			redirect_to polymorphic_path(@voteable.class.to_s.downcase.pluralize)
		end
	end
end