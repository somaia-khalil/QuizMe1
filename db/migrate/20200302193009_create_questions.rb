class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :question_title
      t.string :type
      t.string :image_url

      t.timestamps
    end
  end
end
