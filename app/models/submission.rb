class Submission < ApplicationRecord

    belongs_to :student, class_name: 'User', foreign_key: :user_id
    belongs_to :assignment

    scope :by_user, ->(user) { where( user_id: user.id)}


end
#  submission = assignment.submissions.by_user(current_user).first
# if submission
# show a link_to the submission with text of complete
# else if there's no submission then show a link to the new assignemnt submission path