class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
    	t.date :date
      t.string :location
      t.string :bridename
      t.string :bridephone
      t.string :brideemail
      t.text :bridebio
      t.string :groomname
      t.string :groomphone
      t.string :groomemail
      t.text :groombio
      t.integer :user_id
      t.timestamps
    end
  end
end
