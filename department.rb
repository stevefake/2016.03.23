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
#
# 4.3.1 Methods Added by has_many
#
# When you declare a has_many association, the declaring class automatically gains 16 methods related to the association:
#
# collection(force_reload = false)
# collection<<(object, ...)
## 4.3.1.2 collection<<(object, ...)
## The collection<< method adds one or more objects to the collection by setting their foreign keys to the primary key of the calling model.
## @customer.orders << @order1
# collection.delete(object, ...)
# collection.destroy(object, ...)
# collection=(objects)
# collection_singular_ids
# collection_singular_ids=(ids)
# collection.clear
# collection.empty?
# collection.size
# collection.find(...)
# collection.where(...)
# collection.exists?(...)
# collection.build(attributes = {}, ...)
# collection.create(attributes = {})
# collection.create!(attributes = {})
# In all of these methods, collection is replaced with the symbol passed as the first argument to has_many, and collection_singular is replaced with the singularized version of that symbol. For example, given the declaration:
# class Customer < ActiveRecord::Base
#   has_many :orders
# end
# Each instance of the Customer model will have these methods:
# orders(force_reload = false)
# orders<<(object, ...)
# orders.delete(object, ...)
# orders.destroy(object, ...)
# orders=(objects)
# order_ids
# order_ids=(ids)
# orders.clear
# orders.empty?
# orders.size
# orders.find(...)
## 4.3.1.11 collection.find(...)
## The collection.find method finds objects within the collection. It uses the same syntax and options as ActiveRecord::Base.find.
## @open_orders = @customer.orders.find(1)
# orders.where(...)
# orders.exists?(...)
# orders.build(attributes = {}, ...)
# orders.create(attributes = {})
# orders.create!(attributes = {})

# so... each instance of the Department will have these methods employees<<(object, ...)
# employees=(objects)
# employee_ids
# employees.find(...)
# employees.where(...)
# employees.create(attributes = {})

  def add_employee(new_employee)
    employees<<(new_employee)
  end

  def department_salary
    employees.reduce(0.0) {|sum, e| sum + e.salary}
  end

  def add_employee_review(review)
    employees<<(review)
  end

  def department_raise(alloted_amount)
    raise_eligible = :employees.select {|e| yield(e)}
    amount = alloted_amount / raise_eligible.length
    raise_eligible.each {|e| e.raise_by_amount(amount)}
  end
end
