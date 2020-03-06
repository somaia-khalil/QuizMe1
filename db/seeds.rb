# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Quiz.destroy_all


30.times do 
    User.create({
     nick_name: Faker::Name.name,
      email: Faker::Internet.free_email,
      password_digest: Faker::Internet.password
    })
  end



#   response = RestClient.get("https://opentdb.com/api.php?amount=20&difficulty=easy")

#   quizzes = JSON.parse(response)
  
#   quizzes["items"].each do |quiz|
      
#       quiz.create(title: quiz["results"]["category"], description: quiz["results"]["type"])
#   end
#   binding.pry
#   0


[9,10,11,12,13,14].each do |quiz_n|

  p "create quiz #{quiz_n}"

  response = HTTParty.get("https://opentdb.com/api.php?amount=10&category=#{quiz_n}&difficulty=easy&type=multiple&encode=url3986")
  if response["results"].count > 0
  quiz = Quiz.create!(title: CGI::unescape(response["results"].first["category"]), description: CGI::unescape(response["results"].first["difficulty"]) , image_url: "course#{quiz_n}.jpg") 
  response["results"].each do |q| # for each question in response
    # create the new quiz in the database
    question = Question.create!(quiz_id: quiz.id , question_text: CGI::unescape(q["question"]), question_title: "Question") 

       Answer.create!(question_id: question.id, answer_text: CGI::unescape(q["correct_answer"]), correct: true , points: 10)
       q["incorrect_answers"].each do |i|
       Answer.create!(question_id: question.id, answer_text: CGI::unescape(i), correct: false, points: 0)
       end
    end
   end
end
    


  
  
  
