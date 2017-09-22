class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_surveys, :class_name=> "Survey", :foreign_key=>"creator_id"
  has_many :submissions, :foreign_key=>"submitter_id"
  has_many :submitted_surveys, :through=> :submissions, :source=> :survey

  validates_associated :created_surveys
  validates_associated :submitted_surveys

end
