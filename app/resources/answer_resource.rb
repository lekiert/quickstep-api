require "brackets_excercise.rb"
require "choice_excercise.rb"

class AnswerResource < JSONAPI::Resource
  attributes :answers, :created_at, :results

  relationship :user, to: :one
  relationship :test, to: :one

  def created_at
    @model.created_at.strftime("%H:%S, %d.%m.%Y ")
  end

  def results
    result = {}

    @model.answers.each do |index, answer|
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
    puts result
    result
  end
end
