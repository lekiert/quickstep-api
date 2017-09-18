class ChoiceExcercise < BaseEvaluator
  def self.check(given, correct)
    result = {}
    correct.each do |sentenceId, sentence|
      if !result[sentenceId]
        result[sentenceId] = {
          :score => 0,
          :results => {}
        }
      end
      sentence.each do |choice|
        if !result[sentenceId][:results][choice['text']]
          result[sentenceId][:results][choice['text']] = false

          if choice['correct'] == true and given[sentenceId].include? choice['text']
            result[sentenceId][:results][choice['text']] = true
          elsif choice['correct'] == false and !given[sentenceId].include? choice['text']
            result[sentenceId][:results][choice['text']] = true
          end
        end
      end
      correct = 1
      result[sentenceId][:results].each do |r, v|
        correct = 0 if v == false
      end
      result[sentenceId][:score] += correct
    end

    result
  end
end
