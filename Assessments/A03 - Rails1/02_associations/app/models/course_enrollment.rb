class CourseEnrollment < ApplicationRecord
    belongs_to :student,
        foreign_key: :student_id,
        class_name: :Wizard
    belongs_to :course,
        foreign_key: :course_id,
        class_name: :Course
end
