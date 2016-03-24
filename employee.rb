class Employee < ActiveRecord::Base

  # def initialize(name: nil, email: nil, phone: nil, salary: nil)
  #   @name = name
  #   @email = email
  #   @phone = phone
  #   @salary = salary
  # end

  belongs_to :department
  # 4.1.1 Methods Added by belongs_to
  #
  # When you declare a belongs_to association, the declaring class automatically gains five methods related to the association:
  #
  # association(force_reload = false)
  # association=(associate)
  # build_association(attributes = {})
  # create_association(attributes = {})
#   4.1.1.4 create_association(attributes = {})
#
# The create_association method returns a new object of the associated type. This object will be instantiated from the passed attributes, the link through this object's foreign key will be set, and, once it passes all of the validations specified on the associated model, the associated object will be saved.
#
# @customer = @order.create_customer(customer_number: 123,
#                                    customer_name: "John Doe")
  # create_association!(attributes = {})
  # In all of these methods, association is replaced with the symbol passed as the first argument to belongs_to. For example, given the declaration:
  #
  # class Order < ActiveRecord::Base
  #   belongs_to :customer
  # end
  # Each instance of the Order model will have these methods:
  #
  # customer
  # customer=
  # build_customer
  # create_customer
  # create_customer!
  # When initializing a new has_one or belongs_to association you must use the build_ prefix to build the association, rather than the association.build method that would be used for has_many or has_and_belongs_to_many associations. To create one, use the create_ prefix.

  # @department = @employee.create_department(department_number: 123,
  #                                    department_name: "John Doe")

  def add_employee_review(review)
    @review = review
    positive_matches = 0
    negative_matches = 0

    positive = [/positive/i, /initiative/i, /great/i, /good/i, /helpful/i,
               /puntual/i, /positive/i, /encourage/i, /beneficial/i, /meets/i,
               /good/i, /(team player)/i, /(hard working)/i, /helps/i, /impressed/i, /impressive/i, /fast/i, /asset/i, /leadership/i, /leader/i, /efficient/i, /(willing to help)/i, /successfully/i,
               /pleasure/i]

    negative = [/negative/i, /lazy/i, /bad/i, /stubborn/i, /(misses deadlines)/i,
               /late/i, /concerns/i, /difficulty/i, /struggles/i, /limitations/i,
               /inconsistent/i, /inefficient/i, /(not done well)/i, /poorly/i,
               /badly/i, /rude/i, /(off topic)/i, /lack/i, /inadequate/i, /limitation/i, /(room for improvement)/i, ]
    positive.each do |r|
      matches = @review.scan(r).count
      positive_matches += matches
    end
    negative.each do |r|
      matches = @review.scan(r).count
      negative_matches += matches
    end
    :employees << @employee.satisfactory = (positive_matches > negative_matches)
  end

  def set_employee_performance(boolean)
    @employee.satisfactory = boolean
  end

  def raise_by_percent(raise_percentage)
    @employee.salary += (id.salary * raise_percentage)
  end

  def raise_by_amount(raise_amount)
    @employee.salary += raise_amount
  end
end
