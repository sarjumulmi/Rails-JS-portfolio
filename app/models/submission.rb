class Submission < ActiveRecord::Base
  belongs_to :survey
  belongs_to :submitter, :class_name=>"User", :foreign_key=>"submitter_id"
  has_many :responses, :class_name=> "Answer", :foreign_key =>"response_id"
end
