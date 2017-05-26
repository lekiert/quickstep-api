class ChoiceExercise < BaseEvaluator
  def self.check(given, correct)
    result = {}
    correct.each do |index, sentence|
      if !result[index]
        result[index] = {
          :score => 0,
          :results => {}
        }
      end

      sentence.each do |instance|
        if !result[index][:results][instance['text']]
          result[index][:results][instance['text']] = false

          if instance['correct'] == true and given[index].include? instance['text']
            result[index][:results][instance['text']] = true
            # result[index][:score] += 1
          elsif instance['correct'] == false and !given[index].include? instance['text']
            result[index][:results][instance['text']] = true
            # result[index][:score] += 1
          end
        end
      end

      correct = 1
      result[index][:results].each do |r, v|
        correct = 0 if v == false
      end
      result[index][:score] += correct
    end

    result
  end
end
