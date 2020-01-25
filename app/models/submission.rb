class Submission < ApplicationRecord

    belongs_to :student, class_name: :user
    belongs_to :assignment

end
