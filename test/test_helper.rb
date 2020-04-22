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
  
  def sign_in_as(user, password)
    # This is the code from the video, but getting error: "unknown keyword: session".
    # For Rails 6, according to the video
    #post login_path, session: {email: user.email, password: password}
    #
    # TODO: Why does the above fail, and this work? That is, why is "session" not in
    #       scope in the above for me, but worked in the video?

    # For Rails 5, according to the video
    post login_path, params: { session: { email: user.email, password: password } }
  end

end
