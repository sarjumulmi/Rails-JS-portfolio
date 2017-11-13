require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :submitted, :submitter_id, :survey_id

  def submitted
    "about #{time_ago_in_words(object.created_at)} ago"
  end

end
