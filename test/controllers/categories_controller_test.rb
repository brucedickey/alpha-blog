# SQLite3 DB may become busy locked. Fix is Andrew's answer here:
# https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/learn/lecture/3852574#questions/9537992
# which is to comment out the parallelize line in test/test_helper.rb.

require "test_helper"

class CategoriesControllerTest < ActionController::TestCase

    def setup
        # "Create" instead of "new" so that it hits the test DB.
        # Creating an object so that we can use it to pass the required id for the show method.
        @category = Category.create(name: "sports")
    end

    test "Should get categories index" do
        get :index                 # HTML GET
        assert_response :success
    end

    test "Should get new" do
        get :new
        assert_response :success
    end

    test "Should get show" do
        get(:show, params: {'id' => @category.id})
        assert_response :success
    end

end
