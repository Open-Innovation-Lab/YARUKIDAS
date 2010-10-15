require 'test_helper'

class TopControllerTest < ActionController::TestCase

  context "on GET" do
    setup do
      get :home
    end
  end

end
