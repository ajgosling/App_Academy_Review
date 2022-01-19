require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    salaries.has_key?(title)
  end

  def >(startup)
    @funding > startup.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      new_employee = Employee.new(employee_name, title)
      @employees << new_employee
    else
      raise "title not valid"
    end
  end

  def size
    @employees.size
  end

  def pay_employee(employee)
    pay_amt = @salaries[employee.title]
    if @funding > pay_amt
      employee.pay(pay_amt)
      @funding -= pay_amt
    else
      raise "not enough funding"
    end
  end

  def payday
    @employees.each {|emp| pay_employee(emp)}
  end

  def average_salary
    @employees.sum {|emp| @salaries[emp.title]} / size
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each do |k, v|
      @salaries[k] = v unless @salaries.include?(k)
    end
    @employees += startup.employees
    startup.close
  end
end
