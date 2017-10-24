class Question < ActiveRecord::Base
  belongs_to :survey
  # may require :optional => true
  has_many :answer_choices, dependent: :destroy

  accepts_nested_attributes_for :answer_choices, allow_destroy: true, :reject_if => proc {|atr| atr[:answer_text].blank?}

  def answer_count
    answer_count_hash = {}
    answer_choices.each do |ac|
      answer_count_hash[ac.answer_text] = ac.answers.size
    end
    answer_count_hash
  end
end
