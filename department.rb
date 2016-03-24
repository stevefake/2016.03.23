require './employee'

class Department < ActiveRecord::Base
  # attr_reader :name, :staff, :review

  # def initialize(department_name)
  #   @name = department_name
  #   @staff = []
  # end

has_many :employees
# instances of @staff shoudld point instead to the table :employees
# self.department_id` || `cool_dept.id` || `cool_dept.name

  def add_employee(new_employee)
    employees[new_employee]
  end

  def department_salary
    :employees.reduce(0.0) {|sum, e| sum + e.salary}
  end

  def add_employee_review(review)
    :employees.review = review
  end

  def department_raise(alloted_amount)
    raise_eligible = :employees.select {|e| yield(e)}
    amount = alloted_amount / raise_eligible.length
    raise_eligible.each {|e| e.raise_by_amount(amount)}
  end
end
