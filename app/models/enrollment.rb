class Enrollment < ApplicationRecord
    belongs_to :student, source: :user 
    belongs_to :course


end
