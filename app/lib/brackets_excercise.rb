class BracketsExcercise < BaseEvaluator
  def self.check(given, correct)
    result = {}
    correct.each do |index, sentence|
      sentence.each do |index2, instance|
        if !result[index]
          result[index] = {}
        end

        if !result[index][index2]
          result[index][index2] = false
        end

        if correct[index][index2].split(',').include? given[index][index2].strip
          result[index][index2] = true
        end
      end
    end

    result
  end
end
