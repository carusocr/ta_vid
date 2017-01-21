require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "full title helper" do
    assert_equal full_title, "RoR Tutorial ta_vid App"
    assert_equal full_title("Help"), "Help | RoR Tutorial ta_vid App"
  end
end
