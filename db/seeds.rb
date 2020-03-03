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

response = HTTParty.get("https://opentdb.com/api.php?amount=20&difficulty=easy")

   response["results"].each do |q| # for each quize in response
    # create the new quiz in the database
    quiz = Quiz.create(title: q["category"], description: q["difficulty"]) 
    question = Question.create(quiz_id: quiz.id , question_text: q["question"], question_title: "question") 

       Answer.create(question_id: question.id, answer_text: q["correct_answer"], correct: true)
       q["incorrect_answers"].each do |i|
       Answer.create(question_id: question.id, answer_text: i, correct: false)
       end
    end
   
# binding.pry 
0
    
    


  
  
  
