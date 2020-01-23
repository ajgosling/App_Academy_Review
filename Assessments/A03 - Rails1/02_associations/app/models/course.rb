class Course < ApplicationRecord
    has_many :enrollments,
        foreign_key: :course_id,
        class_name: :CourseEnrollment
    belongs_to :instructor,
        foreign_key: :instructor_id,
        class_name: :Wizard

    has_many :students,
        through: :enrollments,
        source: :student
    has_one :school,
        through: :instructor,
        source: :school
end
