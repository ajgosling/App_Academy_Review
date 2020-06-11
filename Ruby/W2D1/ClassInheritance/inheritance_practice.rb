class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        boss.employees << self if boss
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end

end

class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        @employees = []
        super
    end

    def bonus(multiplier)
        running_bonus = 0

        @employees.each do |emp|
            running_bonus += emp.bonus(1)
        end

        return running_bonus * multiplier
    end
end

ned = Manager.new("ned", "founder", 1000000, nil)
darren = Manager.new("darren", "TA Manager", 78000, ned)
shawna = Employee.new("shawna", "founder", 12000, darren)
david = Employee.new("david", "founder", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000