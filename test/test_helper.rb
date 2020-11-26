# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers

  # Now using a single process to prevent busy locks, since SQLite3 has issues...
  # https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/lecture/3852574#questions/9537992
  #
  # parallelize(workers: :number_of_processors, with: :threads)
  parallelize(workers: 1)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  # Add more helper methods to be used by multiple tests here...


  def sign_in_as(user, password)
    # Session not created yet in integration tests:
    #post login_path, session: {email: user.email, password: password}

    # For Rails 5, according to the video
    post login_path, params: { session: { email: user.email, password: password } }
  end
end
