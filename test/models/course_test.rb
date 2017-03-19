require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    level = Level.first
    @course = Course.new(name: "Test course",
                         description: "test description",
                         level_id: level.id)
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "should have a name of at least 1 character length" do
    @course.name = nil
    assert_not @course.valid?
    @course.name = ""
    assert_not @course.valid?
  end

  test "should have a description of at least 1 character length" do
    @course.description = nil
    assert_not @course.valid?
    @course.description = ""
    assert_not @course.valid?
  end

  # requirement temporarily disabled

  # test "should be assigned to a level" do
  #   @course.level_id = nil
  #   assert_not @course.valid?
  #   @course.level_id = ""
  #   assert_not @course.valid?
  # end
end
