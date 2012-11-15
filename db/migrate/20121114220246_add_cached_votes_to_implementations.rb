class AddCachedVotesToImplementations < ActiveRecord::Migration
  def self.up
    add_column :implementations, :cached_votes_total, :integer, :default => 0
    add_column :implementations, :cached_votes_up, :integer, :default => 0
    add_column :implementations, :cached_votes_down, :integer, :default => 0
    add_index  :implementations, :cached_votes_total
    add_index  :implementations, :cached_votes_up
    add_index  :implementations, :cached_votes_down
  end

  def self.down
    remove_column :implementations, :cached_votes_total
    remove_column :implementations, :cached_votes_up
    remove_column :implementations, :cached_votes_down
  end
end
