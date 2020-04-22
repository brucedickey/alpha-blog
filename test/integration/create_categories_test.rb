
require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

    def setup
        @user = User.create(username: "john", email: "john@example.com", 
                            password: "password", admin: true)
    end

    test "get new category form and create category" do
        # Q: `session` is in scope in the categories_controller_test.rb. 
        #    Why is it not in scope here?
        # A: That was in a ActionController subclass; this is not.
        #session[:user_id] = @user.id   # Simulate admin login

        # Passing the pwd because the create makes a hashed one, and this needs the raw one.
        sign_in_as(@user, "password") 

        get new_category_path                         # GET the new category form via the `new` method in the controller
        assert_template 'categories/new'              # Make sure that is what we got
        assert_difference 'Category.count', 1 do
            # Submit a new category, named "sports"

            # Video says post_via_redirect is not available in Rails 5, but it is not found in my Rails 6 either...
            # So it was not ADDED in 6, it was REMOVED in 5. Need to replace with the lines below.
            # https://stackoverflow.com/questions/36175098/post-via-redirect-is-deprecated-and-will-be-removed-in-rails-5-1/36611914
            #
            #post_via_redirect categories_path, category: {name: "sports"}

            # Posting to categories_path. On success, redirects to categories_path in the create() method. 
            post categories_path, params: {category: {name: "sports"}}
            follow_redirect!
        end
        # This is very confusing. index() is the controller method called for the `/categories` URL when called from the browser,
        # but here we say 'categories/index'.    TODO: Why?
        assert_template 'categories/index'    

        assert_match "sports", response.body   # Verify that "sports" is one of the categories on that page.
    end

    test "invalid category submission results in failure" do
        sign_in_as(@user, "password") 
        
        get new_category_path
        assert_template 'categories/new'
        assert_no_difference 'Category.count' do
            post categories_path, params: {category: {name: ""}}   # Invalid empty string
        end
        assert_template 'categories/new'    
        #assert_select "h2.panel-title"     # Look for existance of this
        #assert_select "div.panel-body"

        # For new course, instead of the lines from the video above.
        assert_select "div.alert-danger"
    end

end
