class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.integer :band_id
      t.integer :venue_id
      t.string :date
    end
  end
end
