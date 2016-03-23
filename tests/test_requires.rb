require 'minitest/autorun'
require 'minitest/pride'
require './department'

require 'rubygems'
require 'bundler/setup'

# Dependenices
require 'active_record'

# Program Things
require './employee'
require './employees_departments_reviews_migration'
require './db_connection.rb'

# EmployeesDepartmentsReviewsMigration.migrate(:up)
