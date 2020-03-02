class AddAnswerIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :answer_id, :integer
  end
end
