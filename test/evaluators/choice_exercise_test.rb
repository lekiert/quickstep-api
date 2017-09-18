require 'test_helper'

class ChoiceExerciseTest < ActiveSupport::TestCase
  def setup
    @evaluator = ChoiceExercise
  end

  test "should match as wrong" do
    correct = {"1"=> [
      {"text"=>"test1", "correct"=>true},
      {"text"=>"test2", "correct"=>true},
      {"text"=>"test3", "correct"=>false}
    ]}
    given = {"1"=>["test2", "test3"]}

    result = @evaluator.check(given, correct)
    assert_equal(result["1"][:score], 0)
  end

  test "should match as correct" do
    correct = {"1"=> [
      {"text"=>"test1", "correct"=>true},
      {"text"=>"test2", "correct"=>true},
      {"text"=>"test3", "correct"=>false}
    ]}
    given = {"1"=>["test1", "test2"]}


    result = @evaluator.check(given, correct)
    assert_equal(result["1"][:score], 1)
  end

  # structure errors are being handled by other class
end
