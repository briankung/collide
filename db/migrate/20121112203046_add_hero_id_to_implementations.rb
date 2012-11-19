class AddHeroIdToImplementations < ActiveRecord::Migration
  def change
    add_column :implementations, :hero_id, :integer
  end
end
