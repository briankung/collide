class AddidentityToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :identity, :string
  end
end
