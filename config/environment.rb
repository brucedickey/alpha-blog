# frozen_string_literal: true

# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# To get rid of Rails' modification of form input styling when the input has an
# error, e.g., when displaying errors in another div rather than styling the
# input field itself.
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.html_safe
end
