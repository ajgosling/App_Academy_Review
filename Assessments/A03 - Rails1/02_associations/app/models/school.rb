class School < ApplicationRecord


    has_many :residents,
        foreign_key: :school_id,
        class_name: :Wizard

    belongs_to :headmaster,
        foreign_key: :headmaster_id,
        class_name: :Wizard

end
