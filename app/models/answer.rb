class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :test

  def results
    result = {}

    self.answers.each do |index, answer|
      ex_result = {}
      excercise = Excercise.find(index)

      case excercise.excercise_type
        when 'BRACKETS'
          ex_result = BracketsExcercise.check(answer, excercise.answers)

        when 'CHOICE'
          ex_result = ChoiceExcercise.check(answer, excercise.answers)

      end
      result[index] = ex_result
    end
    result
  rescue => ex
    {}
  end

  # todo: rename silly vars
  def score
    overall = 0;
    max = 0
    answer_results = self.results

    answer_results.each do |i, answer|
      correct = true
      answer.each do |j, sentence|
        sentence.each do |k, element|
          max = max + 1
          if element == true
            overall = overall + 1
          end
        end
      end
    end

    {
      :max => max,
      :score => overall
    }
  end
end
