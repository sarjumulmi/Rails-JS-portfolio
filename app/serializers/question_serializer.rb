class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question_text
  has_many :answer_choices
end
