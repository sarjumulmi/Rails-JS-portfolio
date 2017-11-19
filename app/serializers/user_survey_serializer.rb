require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class UserSurveySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created
  has_many :submissions

  def created
    "about #{time_ago_in_words(object.created_at)} ago"
  end
  
end
