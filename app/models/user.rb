class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

has_many :enrollments
has_many :courses, through: :enrollments
has_many :courses_as_teacher, class_name: "Course", foreign_key: :teacher_id

has_many :assignments_as_teacher, through: :courses_as_teacher, source: :assignments

has_many :assignments, through: :courses
has_many :submissions
has_many :submitted_assignments, through: :submissions, source: :assignment

validates :email, presence: true 
validates :password, presence:true 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

         def self.from_omniauth(auth)
          binding.pry
            where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
              
              user.provider = auth.provider 
              user.username = auth.info.name
              user.uid = auth.uid
              user.email = auth.info.email
              user.password = Devise.friendly_token[0,20]
            end 
          end 
end
