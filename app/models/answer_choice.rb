class AnswerChoice < ActiveRecord::Base
  belongs_to :question
  has_many :answers

  validates :answer_text, presence: true
  validates :question, presence: true
end
