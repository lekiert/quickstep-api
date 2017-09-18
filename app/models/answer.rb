class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :test

  after_commit do
    self.user.set_overall_score
  end

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
      # ex_result.map { |n| n[:score] *= excercise[:point_factor] }
      ex_result.each do |k, v|
        ex_result[k][:score] *= excercise[:point_factor]
      end
      result[index] = ex_result
    end
    result
  rescue => ex
    puts ex.class
    puts ex
    {}
  end

  # todo: rename silly vars
  def get_score
    if self.score
      self.score
    else
      overall = 0;
      max = 0
      answer_results = self.results
      answer_results.each do |i, answer|
        ex = Excercise.find(i)
        correct = true
        answer.each do |j, sentence|
          max = max + ex[:point_factor]
          overall += sentence[:score]
        end
      end
      result = {
        :max => max,
        :score => overall
      }
      self.score = result
      self.save
      self.score
    end
  end

  def set_score
    score = self.get_score
    self[:score] = score
    self.save
  end
end
