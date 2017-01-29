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
    max = self.answers.keys.count
    answer_results = self.results

    answer_results.each do |index, answer|
      correct = true
      answer.each do |index2, instance|
        instance.each do |index3, instance2|
          if instance2 == false
            correct = false
          end
        end
      end

      if correct == true
        overall = overall + 1
      end
    end

    {
      :max => max,
      :score => overall
    }
  end
end
