class Survey < ActiveRecord::Base
  belongs_to :creator, :class_name=>"User", :foreign_key=>"creator_id"
  has_many :submissions, dependent: :destroy
  has_many :submitters, :through => :submissions, :source => :submitter #user
  has_many :questions, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 8 }
  validates :creator, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true, :reject_if => proc {|atr| atr[:question_text].blank?}

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
    Survey.where('creator_id=?',self.creator_id).next(self.id).first
  end

  def previous
    Survey.where('creator_id=?',self.creator_id).previous(self.id).first
  end

  def published?
    status == true
  end

end
