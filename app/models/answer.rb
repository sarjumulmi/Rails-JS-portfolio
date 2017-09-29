class Answer < ActiveRecord::Base
  belongs_to :answer_choice
  belongs_to :submission

  validates :answer_choice, presence: true
  validates :submission, presence: true

end
