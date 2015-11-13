# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ user_name: 'Chicago' }, { user_name: \'Copenhagen' }])
#   Mayor.create(user_name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  User.create!(id: 1, user_name: 'Glen')
  User.create!(id: 2, user_name: 'Steve')
  User.create!(id: 3, user_name: 'Philbert')
  User.create!(id: 4, user_name: 'Todd')
  User.create!(id: 5, user_name: 'Cylinda')
  User.create!(id: 6, user_name: 'Jovonne')
  User.create!(id: 7, user_name: 'Ithuana')
  User.create!(id: 8, user_name: 'Modesa')
  User.create!(id: 9, user_name: 'Levi')

  Poll.create!(id: 1, title: 'Favorite Stuff', author_id: 3)
  Poll.create!(id: 2, title: 'First things, first', author_id: 9)
  Poll.create!(id: 3, title: 'Levels of fear', author_id: 3)

  Question.create!(id: 1, text: 'What is your favorite Cola?', poll_id: 1)
  Question.create!(id: 2, text: 'What is your favorite writing instrument?', poll_id: 1)
  Question.create!(id: 3, text: 'What is your favorite shade of blue?', poll_id: 1)
  Question.create!(id: 4, text: 'What was your first pet?', poll_id: 2)
  Question.create!(id: 5, text: 'What was your first vehicle\'s fuel type?', poll_id: 2)
  Question.create!(id: 6, text: 'How afraid are you of snakes?', poll_id: 3)
  Question.create!(id: 7, text: 'How afraid are you of heights?', poll_id: 3)
  Question.create!(id: 8, text: 'How afraid are you of getting stranded in an underwater tunnel?', poll_id: 3)

  AnswerChoice.create!(id: 1, text: 'Pepsi', question_id: 1)
  AnswerChoice.create!(id: 2, text: 'Coke', question_id: 1)
  AnswerChoice.create!(id: 3, text: 'Other', question_id: 1)
  AnswerChoice.create!(id: 4, text: 'Pen', question_id: 2)
  AnswerChoice.create!(id: 5, text: 'Pencil', question_id: 2)
  AnswerChoice.create!(id: 6, text: 'Chalk', question_id: 2)
  AnswerChoice.create!(id: 7, text: 'Other', question_id: 2)
  AnswerChoice.create!(id: 8, text: 'Light', question_id: 3)
  AnswerChoice.create!(id: 9, text: 'Dark', question_id: 3)
  AnswerChoice.create!(id: 10, text: 'Standard', question_id: 3)
  AnswerChoice.create!(id: 11, text: 'Dog', question_id: 4)
  AnswerChoice.create!(id: 12, text: 'Cat', question_id: 4)
  AnswerChoice.create!(id: 13, text: 'BeaverFish', question_id: 4)
  AnswerChoice.create!(id: 14, text: 'Other', question_id: 4)
  AnswerChoice.create!(id: 15, text: 'Gasoline', question_id: 5)
  AnswerChoice.create!(id: 16, text: 'Diesel', question_id: 5)
  AnswerChoice.create!(id: 17, text: 'Ethanol', question_id: 5)
  AnswerChoice.create!(id: 18, text: 'Hybrid/Combined', question_id: 5)
  AnswerChoice.create!(id: 19, text: 'Electricity', question_id: 5)
  AnswerChoice.create!(id: 20, text: 'Natural Gas', question_id: 5)
  AnswerChoice.create!(id: 21, text: 'Other', question_id: 5)
  AnswerChoice.create!(id: 22, text: 'Not at all', question_id: 6)
  AnswerChoice.create!(id: 23, text: 'Somewhat', question_id: 6)
  AnswerChoice.create!(id: 24, text: 'Highly', question_id: 6)
  AnswerChoice.create!(id: 25, text: 'All the way', question_id: 6)
  AnswerChoice.create!(id: 26, text: 'Not at all', question_id: 7)
  AnswerChoice.create!(id: 27, text: 'Somewhat', question_id: 7)
  AnswerChoice.create!(id: 28, text: 'Highly', question_id: 7)
  AnswerChoice.create!(id: 29, text: 'All the way', question_id: 7)
  AnswerChoice.create!(id: 30, text: 'Not at all', question_id: 8)
  AnswerChoice.create!(id: 31, text: 'Somewhat', question_id: 8)
  AnswerChoice.create!(id: 32, text: 'Highly', question_id: 8)
  AnswerChoice.create!(id: 33, text: 'All the way', question_id: 8)

  Response.create!(id: 1, respondent_id: 1, answer_choice_id: 1)
  Response.create!(id: 2, respondent_id: 1, answer_choice_id: 7)
  Response.create!(id: 3, respondent_id: 1, answer_choice_id: 8)
  Response.create!(id: 4, respondent_id: 1, answer_choice_id: 11)
  Response.create!(id: 5, respondent_id: 1, answer_choice_id: 17)
  Response.create!(id: 6, respondent_id: 1, answer_choice_id: 22)
  Response.create!(id: 7, respondent_id: 1, answer_choice_id: 26)
  Response.create!(id: 8, respondent_id: 1, answer_choice_id: 30)
  Response.create!(id: 9, respondent_id: 2, answer_choice_id: 2)
  Response.create!(id: 10, respondent_id: 2, answer_choice_id: 7)
  Response.create!(id: 11, respondent_id: 2, answer_choice_id: 9)
  Response.create!(id: 12, respondent_id: 2, answer_choice_id: 11)
  Response.create!(id: 13, respondent_id: 2, answer_choice_id: 20)
  Response.create!(id: 14, respondent_id: 2, answer_choice_id: 22)
  Response.create!(id: 15, respondent_id: 2, answer_choice_id: 27)
  Response.create!(id: 16, respondent_id: 2, answer_choice_id: 32)
  Response.create!(id: 20, respondent_id: 3, answer_choice_id: 13)
  Response.create!(id: 21, respondent_id: 3, answer_choice_id: 15)
  Response.create!(id: 25, respondent_id: 4, answer_choice_id: 2)
  Response.create!(id: 26, respondent_id: 4, answer_choice_id: 4)
  Response.create!(id: 27, respondent_id: 4, answer_choice_id: 8)
  Response.create!(id: 28, respondent_id: 4, answer_choice_id: 13)
  Response.create!(id: 29, respondent_id: 4, answer_choice_id: 15)
  Response.create!(id: 30, respondent_id: 4, answer_choice_id: 25)
  Response.create!(id: 31, respondent_id: 4, answer_choice_id: 26)
  Response.create!(id: 32, respondent_id: 4, answer_choice_id: 31)
  Response.create!(id: 33, respondent_id: 5, answer_choice_id: 2)
  Response.create!(id: 34, respondent_id: 5, answer_choice_id: 6)
  Response.create!(id: 35, respondent_id: 5, answer_choice_id: 10)
  Response.create!(id: 36, respondent_id: 5, answer_choice_id: 14)
  Response.create!(id: 37, respondent_id: 5, answer_choice_id: 17)
  Response.create!(id: 38, respondent_id: 5, answer_choice_id: 25)
  Response.create!(id: 39, respondent_id: 5, answer_choice_id: 28)
  Response.create!(id: 40, respondent_id: 5, answer_choice_id: 30)
  Response.create!(id: 41, respondent_id: 6, answer_choice_id: 3)
  Response.create!(id: 42, respondent_id: 6, answer_choice_id: 4)
  Response.create!(id: 43, respondent_id: 6, answer_choice_id: 8)
  Response.create!(id: 44, respondent_id: 6, answer_choice_id: 11)
  Response.create!(id: 45, respondent_id: 6, answer_choice_id: 21)
  Response.create!(id: 46, respondent_id: 6, answer_choice_id: 24)
  Response.create!(id: 47, respondent_id: 6, answer_choice_id: 29)
  Response.create!(id: 48, respondent_id: 6, answer_choice_id: 33)
  Response.create!(id: 49, respondent_id: 7, answer_choice_id: 3)
  Response.create!(id: 50, respondent_id: 7, answer_choice_id: 7)
  Response.create!(id: 51, respondent_id: 7, answer_choice_id: 10)
  Response.create!(id: 52, respondent_id: 7, answer_choice_id: 11)
  Response.create!(id: 53, respondent_id: 7, answer_choice_id: 18)
  Response.create!(id: 54, respondent_id: 7, answer_choice_id: 24)
  Response.create!(id: 55, respondent_id: 7, answer_choice_id: 28)
  Response.create!(id: 56, respondent_id: 7, answer_choice_id: 30)
  Response.create!(id: 57, respondent_id: 8, answer_choice_id: 1)
  Response.create!(id: 58, respondent_id: 8, answer_choice_id: 6)
  Response.create!(id: 59, respondent_id: 8, answer_choice_id: 8)
  Response.create!(id: 60, respondent_id: 8, answer_choice_id: 13)
  Response.create!(id: 61, respondent_id: 8, answer_choice_id: 21)
  Response.create!(id: 62, respondent_id: 8, answer_choice_id: 24)
  Response.create!(id: 63, respondent_id: 8, answer_choice_id: 27)
  Response.create!(id: 64, respondent_id: 8, answer_choice_id: 33)
  Response.create!(id: 65, respondent_id: 9, answer_choice_id: 3)
  Response.create!(id: 66, respondent_id: 9, answer_choice_id: 7)
  Response.create!(id: 67, respondent_id: 9, answer_choice_id: 9)
  Response.create!(id: 70, respondent_id: 9, answer_choice_id: 25)
  Response.create!(id: 71, respondent_id: 9, answer_choice_id: 29)
  Response.create!(id: 72, respondent_id: 9, answer_choice_id: 31)

end
