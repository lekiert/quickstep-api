class BracketsExercise < BaseEvaluator
  def self.check(given, correct)
    result = {}
    correct.each do |sentenceId, sentence|
      result[sentenceId] = {
        :score => 0,
        :results => {}
      }

      sentence.each do |bracketId, bracket|
        if !result[sentenceId][:results][bracketId]
          result[sentenceId][:results][bracketId] = false
        end

        if correct[sentenceId][bracketId].split(',').include? given[sentenceId][bracketId].strip
          result[sentenceId][:results][bracketId] = true

        end
      end

      should_pass = true
      result[sentenceId][:results].each do |k, v|
        should_pass = result[sentenceId][:results][k]
      end

      if should_pass == true
        result[sentenceId][:score] += 1
      end
    end

    result
  end
end
