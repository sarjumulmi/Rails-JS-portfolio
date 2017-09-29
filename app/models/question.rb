class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answer_choices, dependent: :destroy

  validates :question_text, presence: true, length: { minimum: 10 }
  validates :survey, presence: true

  def answer_count
    answer_count_hash = {}
    answer_choices.each do |ac|
      answer_count_hash[ac.answer_text] = ac.answers.size
    end
    answer_count_hash
  end
end
