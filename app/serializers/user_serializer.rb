class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :created_surveys, serializer: UserSurveySerializer
  has_many :participated_surveys, serializer: UserSurveySerializer
  # has_many :submissions
end
