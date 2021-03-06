class Assignment < ApplicationRecord

    belongs_to :course 
    has_many :submissions
    # has_many :assignments_as_teacher
    accepts_nested_attributes_for :course, reject_if: :all_blank

    validates :assignment_name, :presence => true, uniqueness: {scope: [:course_id ]} 
end
