# Tests use the test DB, not the devleopment DB

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        # Runs before each test
        @category = Category.new(name: "sports")

    end

    test "Category should be valid" do
        assert @category.valid?
    end

    test "Category name should be present" do
        @category.name = ""           # Set to invalid name
        assert_not @category.valid?   # Passes if name is not valid
    end

    test "Category name should be unique" do
        @category.save   # Save in test DB
        category2 = Category.new(name: "sports")   # Another with the same name
        assert_not category2.valid?
    end

    test "Category name should not be too long" do
        @category.name ="a" * 26   # Max is 25
        assert_not @category.valid?
    end

    test "Category name should not be too short" do
        @category.name ="aa"   # Min is 3
        assert_not @category.valid?
    end
    
end
