class Survey < ActiveRecord::Base
  belongs_to :creator, :class_name=>"User", :foreign_key=>"creator_id"
  has_many :submissions
  has_many :submitters, :through => :submissions, :source => :submitter
  has_many :questions

  validates :title, presence: true

  accepts_nested_attributes_for :questions


end
