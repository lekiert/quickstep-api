require 'test_helper'

class ExcerciseTest < ActiveSupport::TestCase
  def setup
    @excercise = Excercise.new(name: "Test",
                     command: "test command",
                     code: "A",
                     status: 1)
  end

  test "should be valid" do
    assert @excercise.valid?
  end

  test "should have a name" do
    @excercise.name = ""
    assert_not @excercise.valid?
  end

  test "should have a command" do
    @excercise.command = ""
    assert_not @excercise.valid?
  end

  test "should have a code" do
    @excercise.code = ""
    assert_not @excercise.valid?
  end

  test "should have a valid status" do
    @excercise.status = ""
    assert_not @excercise.valid?
    @excercise.status = "test"
    assert_not @excercise.valid?
    @excercise.status = "2"
    assert_not @excercise.valid?
    @excercise.status = 2
    assert_not @excercise.valid?
    @excercise.status = -1
    assert @excercise.valid?
    @excercise.status = 0
    assert @excercise.valid?
    @excercise.status = 1
    assert @excercise.valid?
  end
end
