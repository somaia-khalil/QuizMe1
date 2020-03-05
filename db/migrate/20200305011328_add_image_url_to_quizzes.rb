class AddImageUrlToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :image_url, :string
  end
end
