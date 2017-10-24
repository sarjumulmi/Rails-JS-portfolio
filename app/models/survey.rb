class Survey < ActiveRecord::Base
  belongs_to :creator, :class_name=>"User", :foreign_key=>"creator_id"
  has_many :submissions, dependent: :destroy
  has_many :submitters, :through => :submissions, :source => :submitter #user
  has_many :questions, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 8 }
  validates :creator, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true, :reject_if => proc {|atr| atr[:question_text].blank?}

  def published?
    status == true
  end

end
