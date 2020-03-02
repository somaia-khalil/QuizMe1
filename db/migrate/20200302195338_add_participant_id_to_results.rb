class AddParticipantIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :participant_id, :integer
  end
end
