require 'rubygems'
require 'bundler/setup'

require 'minitest/autorun'
require 'minitest/pride'

# Dependenices
require 'active_record'
# require 'pry'

# Program Things
require './department'
require './employee'
require './employees_departments_reviews_migration'
require './db_connection.rb'

 # EmployeesDepartmentsMigration.migrate(:up)
