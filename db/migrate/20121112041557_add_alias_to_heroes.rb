class AddAliasToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :alias, :string
  end
end
