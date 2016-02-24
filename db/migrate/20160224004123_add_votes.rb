class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :track, index: true
      t.timestamps null: false
    end

    add_column :tracks, :upvote, :integer, default: 0
  end
end
