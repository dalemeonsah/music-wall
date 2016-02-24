class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.timestamps null: false
    end

    create_table :usertracks do |t|
      t.belongs_to :tracks, index: true
      t.belongs_to :users, index: true
      t.integer :upvote_counter, default: 0
      t.timestamps null: false
    end
  end
end
