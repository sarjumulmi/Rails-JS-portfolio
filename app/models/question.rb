class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  has_many :answer_choices

  validates :question_text, presence: true

  def answer_count
    answer_count_hash = {}
    answer_choices.each do |ac|
      count = Answer.where("answer_text=? and question_id = ?", ac.answer_text, id).count
      answer_count_hash[ac.answer_text] = count
    end
    answer_count_hash
  end
end
