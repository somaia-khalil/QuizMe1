class AddQuizIdToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :quiz_id, :integer
  end
end
