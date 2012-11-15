class AddCachedVotesToConcepts < ActiveRecord::Migration
  def self.up
    add_column :concepts, :cached_votes_total, :integer, :default => 0
    add_column :concepts, :cached_votes_up, :integer, :default => 0
    add_column :concepts, :cached_votes_down, :integer, :default => 0
    add_index  :concepts, :cached_votes_total
    add_index  :concepts, :cached_votes_up
    add_index  :concepts, :cached_votes_down
  end

  def self.down
    remove_column :concepts, :cached_votes_total
    remove_column :concepts, :cached_votes_up
    remove_column :concepts, :cached_votes_down
  end
end
