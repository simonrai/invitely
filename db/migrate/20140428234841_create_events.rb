class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :name
    	t.date :date
    	t.datetime :time
    	t.string :location
    	t.boolean :rsvp
    	t.text :notes
    	t.integer :order
    	t.integer :invitation_id
    	t.timestamps
    end
  end
end
