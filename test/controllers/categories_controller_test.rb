# frozen_string_literal: true

# SQLite3 DB may become busy locked. Fix is Andrew's answer here:
# https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/lecture/3852574#questions/9537992
# which is to comment out the parallelize line in test/test_helper.rb.

require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
  def setup
    # "Create" instead of "new" so that it hits the test DB.
    # Creating an object so that we can use it to pass the required id for the show method.
    @category = Category.create(name: "sports")
    @user     = User.create(username: "john", email: "john@example.com",
                            password: "password", admin: true,)
  end

  test "Should get categories index" do
    get :index # HTML GET
    assert_response :success
  end

  test "Should get new" do
    # TODO: How is `session` in scope?
    session[:user_id] = @user.id # Simulate admin login

    get :new
    assert_response :success
  end

  test "Should get show" do
    get(:show, params: {"id" => @category.id})
    assert_response :success
  end

  test "Should redirect the create action when an admin is not logged in" do
    # The setup() method does not log in a user, so the redirect should happen.
    assert_no_difference "Category.count", "assert_no_difference \"Category.count\"" do
      # In create_categories_test.rb, the line below is used w/ current Rails 6 version,
      # but does not work here. This is the line from the "Text Directions and code"
      # for Rails 5 as well.
      # TODO: Why does it work in create_categories_test.rb, but not here?
      # post categories_path, params: {category: {name: "sports"}}   # Rails 5

      # This is from the video. Error: "catetory is undefined"
      # TODO: Assuming no errors, how does this specify a route, the correct route?
      # post :create, category: {name: "sports"}

      # This works, and initially returns 200 success instead of 3xx redirect, because
      # the category new page is not limited to admin users yet.
      post :create, params: {category: {name: "sports"}}
    end

    assert_redirected_to categories_path, "assert_redirected_to categories_path"
  end
end
