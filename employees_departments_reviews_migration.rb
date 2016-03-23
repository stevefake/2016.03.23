class EmployeesDepartmentsMigration < ActiveRecord::Migration

  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :salary
      t.string :review
      t.boolean :satisfactory
    end

    create_table :departments do |t|
      t.string :name
      t.string :staff
      t.string :review
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
