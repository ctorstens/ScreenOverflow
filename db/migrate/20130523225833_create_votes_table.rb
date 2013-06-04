class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :votable, :polymorphic => true
      t.integer :value, :default => 0

      t.timestamps
    end
    add_index :votes, [:votable_id, :votable_type, :user_id], :unique => true, :name => "vote_key"
  end
end
