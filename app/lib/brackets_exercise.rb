class BracketsExercise < BaseEvaluator
  def self.check(given, correct)
    result = {}
    correct.each do |index, sentence|
      result[index] = {
        :score => 0,
        :results => {}
      }

      sentence.each do |index2, instance|
        if !result[index][:results][index2]
          result[index][:results][index2] = false
        end

        if correct[index][index2].split(',').include? given[index][index2].strip
          result[index][:results][index2] = true
          result[index][:score] += 1
        end
      end
    end

    result
  end
end
