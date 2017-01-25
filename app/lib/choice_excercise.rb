class ChoiceExcercise < BaseEvaluator
  def self.check(given, correct)
    result = {}
    correct.each do |index, sentence|
      sentence.each do |instance|
        if !result[index]
          result[index] = {}
        end

        if !result[index][instance['text']]
          result[index][instance['text']] = false

          if instance['correct'] == true and given[index].include? instance['text']
            result[index][instance['text']] = true
          elsif instance['correct'] == false and !given[index].include? instance['text']
            result[index][instance['text']] = true
          end

        end

      end
    end

    result
  end
end
