class CreateProposalOptionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :proposal_options do |t|
      t.integer :proposal_id
      t.string :name
    end
  end
end
