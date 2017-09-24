class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  has_many :answer_choices

  validates :question_text, presence: true
end
