class CreateUserVotesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_votes do |t|
      t.integer :user_id
      t.integer :proposal_id
      t.integer :option_id
      t.datetime :created_at, default: Time.now
    end
  end
end
