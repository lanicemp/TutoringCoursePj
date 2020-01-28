class Submission < ApplicationRecord

    belongs_to :student, class_name: 'User'
    belongs_to :assignment

end
