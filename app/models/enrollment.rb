class Enrollment < ApplicationRecord
    belongs_to :student, class_name: :user
    belongs_to :course


end
