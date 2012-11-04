class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :url
      t.text :source

      t.timestamps
    end
  end
end
