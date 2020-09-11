# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    # Empty, so by default by convention expects a
    # home.html.erb in app/views/pages/.
    redirect_to articles_path if logged_in?
  end

  def about; end
end
