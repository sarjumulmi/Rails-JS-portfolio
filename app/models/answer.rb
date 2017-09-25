class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission

  validates :answer_text, presence: true

  def self.answer_count(answer_choice)
    where("answer_text=? and question_id = ?", answer_choice.answer_text, answer_choice.question_id).count
  end
end
