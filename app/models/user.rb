class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,:omniauth_providers => [:facebook, :github]

  has_many :created_surveys, :class_name=> "Survey", :foreign_key=>"creator_id"
  has_many :submissions, :foreign_key=>"submitter_id"
  has_many :participated_surveys, :through=> :submissions, :source=> :survey

  validates_associated :created_surveys
  validates_associated :submitted_surveys

  def self.from_omniauth(auth)
    where(:provider=>auth.provider, :uid=>auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
