class Course < ApplicationRecord
    belongs_to :teacher, class_name: 'User'
    has_many :assignments
    has_many :enrollments
    has_many :students, through: :enrollments, source: :user
    # has_many :assignments_as_teacher

    # accepts_nested_attributes_for :assignments, reject_if: :all_blank
    # accepts_nested_attributes_for :teacher reject_if: :all_blank

    # validates :content, presence: true
    # validates :content, length: { minimum: 10 }
    validates :course_name, :presence => true
    validates :description, :presence => true

end
