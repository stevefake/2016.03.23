class EmployeesDepartmentsMigration < ActiveRecord::Migration

  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :salary
      t.string :review
      t.boolean :satisfactory
      # t.string :staff
      t.belongs_to :department, index = true
      t.integer :department_id
    end
    # add a foreign key to the employees table which points to a department in the
    # departments table.

    create_table :departments do |t|
      t.string :name
      t.string :employee_id
      # t.string :staff # should be moved to employee table; need an id somewhere to track; whose responsibility relates to whose? think lucidcharts
      # t.string :review # should be moved to employee table; review field just for employees table
    end
  end

end

# class StudentsAndPicksMigration < ActiveRecord::Migration
#   def change
#     create_table :students do |t|
#       t.string :name
#     end
#
#     create_table :picks do |t|
#       t.integer :student_id
#       t.timestamp :picked_on
#     end
#   end
# end
