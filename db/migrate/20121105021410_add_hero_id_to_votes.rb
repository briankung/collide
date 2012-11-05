class AddHeroIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :hero_id, :integer
  end
end
