class AddQuestionIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :question_id, :integer
  end
end
