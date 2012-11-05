class CreateImplementations < ActiveRecord::Migration
  def change
    create_table :implementations do |t|
      t.string :name
      t.string :source_url
      t.string :live_url
      t.text :description
      t.text :source_code
      t.integer :concept_id

      t.timestamps
    end
  end
end
