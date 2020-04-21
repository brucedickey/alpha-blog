ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers

  # Removing to prevent busy locks, since SQLite3 has issues...
  # https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/lecture/3852574#questions/9537992
  #parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
