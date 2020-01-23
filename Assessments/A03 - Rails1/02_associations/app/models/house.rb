class House < ApplicationRecord
    belongs_to :master,
        foreign_key: :master_id,
        class_name: :Wizard
    has_many :students,
        foreign_key: :house_id,
        class_name: :Wizard
    has_one :school,
        through: :master,
        source: :school
end
