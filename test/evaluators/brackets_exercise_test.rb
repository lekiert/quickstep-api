require 'test_helper'

class BracketsExcerciseTest < ActiveSupport::TestCase
  def setup
    @evaluator = BracketsExcercise
  end

  test "should return all correct" do
    correct = {
      "1": {"0": "ma,miala", "1": "ma,mial"},
      "2": {"0": "a", "1": "b"}
    }

    given = {
      "1": {"0": "ma", "1": "mial"},
      "2": {"0": "a", "1": "b"}
    }

    result = @evaluator.check(given, correct)
    assert_equal(result[:"1"][:score], 1)
    assert_equal(result[:"2"][:score], 1)
  end

  test "should match wrong answer as false" do
    correct = {
      "1": {"0": "ma,miala", "1": "ma,mial"},
      "2": {"0": "a", "1": "b"}
    }

    given = {
      "1": {"0": "ma", "1": "mial"},
      "2": {"0": "a", "1": "c"}
    }

    result = @evaluator.check(given, correct)
    assert_equal(result[:"1"][:score], 1)
    assert_equal(result[:"2"][:score], 0)
  end

  test "should match all answers as wrog" do
    correct = {
      "1": {"0": "ma,miala", "1": "ma,mial"},
      "2": {"0": "a", "1": "b"}
    }

    given = {
      "1": {"0": "x", "1": "x"},
      "2": {"0": "x", "1": "x"}
    }

    result = @evaluator.check(given, correct)
    assert_equal(result[:"1"][:score], 0)
    assert_equal(result[:"2"][:score], 0)
  end

  # structure errors are being handled by other class
end
