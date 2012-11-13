class AddHeroIdToImplementations < ActiveRecord::Migration
  def change
    add_column :implementations, :hero_id, :string
  end
end
