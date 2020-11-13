# frozen_string_literal: true

require "test_helper"

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "john", email: "john@example.com",
                        password: "password", admin: true,)
  end

  test "get new category form and create category" do
    # Passing the pwd because the create makes a hashed one, and this needs the raw one.
    sign_in_as(@user, "password")

    # GET new category form via `new` method in the controller
    get new_category_path

    assert_template "categories/new" # Make sure that is what we got
    assert_difference "Category.count", 1 do
      # Submit a new category, named "sports"

      # Video says post_via_redirect is not available in Rails 5, but it is not found in my Rails 6
      #   either...
      # So it was not ADDED in 6, it was REMOVED in 5. Need to replace with the lines below.
      # https://stackoverflow.com/questions/36175098/
      #    post-via-redirect-is-deprecated-and-will-be-removed-in-rails-5-1/36611914
      #
      # post_via_redirect categories_path, category: {name: "sports"}

      # Posting to categories_path. On success, redirects to categories_path in create().
      post categories_path, params: {category: {name: "sports"}}
      follow_redirect!
    end

    # Confusing: index() is the controller method called for the `/categories` URL when called
    # from the browser, but here we say 'categories/index'.    TODO: Why?
    assert_template "categories/index"
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do
    sign_in_as(@user, "password")

    get new_category_path
  
    assert_template "categories/new"
    assert_no_difference "Category.count" do
      post categories_path, params: {category: {name: ""}}   # Pass an invalid empty string
    end
    assert_template "categories/new"
    assert_select "div.alert-danger"
  end
end
