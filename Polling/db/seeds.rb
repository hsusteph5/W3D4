# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



ActiveRecord::Base.transaction do

  User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  AnswerChoice.destroy_all
  Response.destroy_all
  
  user1 = User.create({username: 'Ninja'})
  user2 = User.create({username: 'Summit1G'})
  user3 = User.create({username: 'Shroud'})

  poll1 = Poll.create({title: 'Twitch asks', user_id: user1.id})
  poll2 = Poll.create({title: 'PUBG', user_id: user3.id})

  question1 = Question.create({text: 'Who is best streamer?', poll_id: poll1.id})
  question2 = Question.create({text: 'Who is best PUBG player?', poll_id: poll2.id})

  answer_choice1 = AnswerChoice.create({text: 'me', question_id: question1.id})
  answer_choice2 = AnswerChoice.create({text: 'Shroud', question_id: question1.id})
  answer_choice3 = AnswerChoice.create({text: 'TSMMyth', question_id: question1.id})

  answer_choice4 = AnswerChoice.create({text: 'me', question_id: question2.id})
  answer_choice5 = AnswerChoice.create({text: 'JoshOG', question_id: question2.id})
  answer_choice6 = AnswerChoice.create({text: 'DrDisrepect', question_id: question2.id})

  response1 = Response.create({user_id: user1.id, answer_choice_id: answer_choice1.id})
  response2 = Response.create({user_id: user2.id, answer_choice_id: answer_choice1.id})
  response3 = Response.create({user_id: user3.id, answer_choice_id: answer_choice1.id})
  response4 = Response.create({user_id: user1.id, answer_choice_id: answer_choice6.id})
  response5 = Response.create({user_id: user2.id, answer_choice_id: answer_choice5.id})
  
end