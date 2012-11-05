class AddHeroIdToConcepts < ActiveRecord::Migration
  def change
    add_column :concepts, :hero_id, :integer
  end
end
