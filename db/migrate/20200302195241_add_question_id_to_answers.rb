class AddQuestionIdToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :question_id, :integer
  end
end
