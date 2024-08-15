class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
