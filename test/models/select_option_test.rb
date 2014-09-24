require 'test_helper'

class SelectOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without title" do
    so = SelectOption.new
    assert_not so.save, "Saved the option without domain"
    so.domain = 'X'
    assert_not so.save, "Saved the option without code_value"
    so.code_value = 'X'
    assert_not so.save, "Saved the option without display_value"
    so.display_value = 'X'
    assert so.save, "Save failed"
  end
end
