class Submission < ActiveRecord::Base
  belongs_to :survey
  belongs_to :submitter, :class_name=>"User", :foreign_key=>"submitter_id"
  has_many :answers
end
