# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(:email=>"creator@example.com", :password=>"testtest")
user2 = User.create(:email=>"taker1@example.com", :password=>"testtest")
user3 = User.create(:email=>"taker2@example.com", :password=>"testtest")
survey1 = Survey.create(:title=>"Medical Survey1", :creator=>user1)
sub1 = Sumbission.create(:submitter=>user2, :survey=>survey1)
sub2 = Sumbission.create(:submitter=>user3, :survey=>survey1)
q1 = Question.create(:question_text=>"How do you feel?")
q2 = Question.create(:question_text=>"Are you feeling sick?")
q3 = Question.create(:question_text=>"Are you taking meds?")
a1 = q1.answers.create(:answer_text=>"Good")
a2 = q1.answers.create(:answer_text=>"Fair")
a3 = q1.answers.create(:answer_text=>"Bad")
a4 = q2.answers.create(:answer_text=>"Yes")
a5 = q2.answers.create(:answer_text=>"No")
a6 = q3.answers.create(:answer_text=>"Tylenol")
a7 = q3.answers.create(:answer_text=>"Vitamins")
a8 = q3.answers.create(:answer_text=>"None")
survey1.questions = [q1, q2, q3]
sub1.responses = [a1, a4, a6]
sub2.responses = [a2, a4, a8]
