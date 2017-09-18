require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @test = Test.create(name: "Test",
                     description: "test description",
                     code: "A")
    @exercise = Exercise.new(name: "Test",
                                      command: "test command",
                                      code: "A",
                                      status: 1)
    @test.exercises << @exercise
  end

  test "should be valid" do
    assert @exercise.valid?
  end

  test "should have a name" do
    @exercise.name = ""
    assert_not @exercise.valid?
  end

  test "should have a command" do
    @exercise.command = ""
    assert_not @exercise.valid?
  end

  test "should have a code" do
    @exercise.code = ""
    assert_not @exercise.valid?
  end

  test "should have a valid status" do
    @exercise.status = ""
    assert_not @exercise.valid?
    @exercise.status = "test"
    assert_not @exercise.valid?
    @exercise.status = "2"
    assert_not @exercise.valid?
    @exercise.status = 2
    assert_not @exercise.valid?
    @exercise.status = -1
    assert @exercise.valid?
    @exercise.status = 0
    assert @exercise.valid?
    @exercise.status = 1
    assert @exercise.valid?
  end
end
