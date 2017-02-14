class CreateProposalsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.string :name
      t.integer :creator_id
      t.string :status
      t.datetime :deadline, default: Time.now
    end
  end
end
