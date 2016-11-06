require 'test_helper'

class LevelTest < ActiveSupport::TestCase
  def setup
    @level = Level.new(name: "Intermediate")
  end

  test "should be valid" do
    assert @level.valid?
  end

  test "should have a name of at least 1 character length" do
    @level.name = nil
    assert_not @level.valid?
    @level.name = ""
    assert_not @level.valid?
  end
end
