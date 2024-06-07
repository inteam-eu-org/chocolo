require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test "the validity of incomplete questions" do
    questions = []
    questions << Question.new(properties: {
      "kind": "simple",
    })
    questions << Question.new(properties: {
      "primaryText": "simple",
      "turns": "2"
    })
    questions << Question.new(properties: {
      "turns": "2"
    })
    assert questions.all?(&:invalid?)
  end

  test "the validity of invalid questions" do
    questions = []
    # wrong kind
    questions << Question.new(properties: {
      "kind": "random",
      "sips": 2,
      "primaryText": "What is the capital of France?",
      "turns": 2
    })
    # turns is a string
    questions << Question.new(properties: {
      "kind": "simple",
      "sips": 2,
      "primaryText": "What is the capital of France?",
      "turns": "2"
    })
    assert questions.all?(&:invalid?)
  end

  test "the validity of complete questions" do
    questions = []
    questions << Question.create(properties: {
      "kind": "simple",
      "sips": 2,
      "primaryText": "What is the capital of France?",
    })
    questions << Question.create(properties: {
      "kind": "simple",
      "primaryText": "What is the capital of France?",
      "turns": 2,
      "sips": 2,
    })
    assert questions.all?(&:valid?)
  end
end
