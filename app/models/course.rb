class Course < ApplicationRecord
    belongs_to :teacher, class_name: 'User'
    has_many :assignments
    has_many :enrollments
    has_many :students, through: :enrollments, source: :user
    has_many :assignments_as_teacher do 
        def assignments_as_teacher
            includes(:assignments, :teacher_id)
        end 
    end 

    # accepts_nested_attributes_for :assignments, reject_if: :all_blank
    # accepts_nested_attributes@_for :teacher reject_if: :all_blank

    # validates :content, presence: true
    # validates :content, length: { minimum: 10 }
    validates :course_name, :presence => true, uniqueness: true 
    validates :description, :presence => true

end
