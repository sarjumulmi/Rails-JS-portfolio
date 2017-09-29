class Submission < ActiveRecord::Base
  belongs_to :survey
  belongs_to :submitter, :class_name=>"User", :foreign_key=>"submitter_id"
  has_many :answers, dependent: :destroy

  validates :survey, presence: true

  def build_from_answer_choice(answer_choice_ids)
    answer_choice_ids.reject{|ac| ac.empty?}.each do |ac_id|
      answers.build({:answer_choice_id => ac_id})
    end
  end



end
