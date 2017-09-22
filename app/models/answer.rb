class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission, :foreign_key=>"response_id"
end
