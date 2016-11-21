require 'test_helper'

class TestTest < ActiveSupport::TestCase
  def setup
    @level = Level.create(name: 'Beginner')
    @test = Test.new(name: "Test",
                     description: "test description",
                     code: "A")
    @level.tests << @test
  end

  test "should be valid" do
    assert @test.valid?
  end

  test "should have a name" do
    @test.name = ""
    assert_not @test.valid?
  end

  test "should have a description" do
    @test.description = ""
    assert_not @test.valid?
  end

  test "should have a code" do
    @test.code = ""
    assert_not @test.valid?
  end
end
