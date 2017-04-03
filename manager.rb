require_relative "employee"

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplyer)
    total = 0
    employees.each do |emp|
      total += emp.salary
      if emp.is_a?(Manager)
        emp.employees.each{|sub_emp| total += sub_emp.salary}
      end
    end
    total * multiplyer

  end
end
david = Employee.new("David", "TA", 10_000, "Darren")
shawna = Employee.new("Shawna", "TA", 12_000, "Darren")

darren = Manager.new("Darren", "TA Manager", 78_000, "Ned", [david, shawna])
ned = Manager.new("Ned", "Founder", 1_000_000, nil, [darren])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
