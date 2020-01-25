class Submission < ApplicationRecord

    belongs_to :student, source: :user 
    belongs_to :assignment

end
