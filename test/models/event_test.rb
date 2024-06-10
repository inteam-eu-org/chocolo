require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "the validity of incomplete events" do
    events = []
    events << Event.new(properties: {
      "kind": "simple",
    })
    events << Event.new(properties: {
      "texts": ["simple"],
      "turns": "2"
    })
    events << Event.new(properties: {
      "turns": "2"
    })
    assert events.all?(&:invalid?)
  end

  test "the validity of invalid events" do
    events = []
    # wrong kind
    events << Event.new(properties: {
      "kind": "random",
      "sips": 2,
      "texts": ["What is the capital of France?"],
      "turns": 2
    })
    # first is a string
    events << Event.new(properties: {
      "kind": "simple",
      "sips": 2,
      "texts": ["What is the capital of France?"],
      "first": "2"
    })
    assert events.all?(&:invalid?)
  end

  test "the validity of complete events" do
    events = []
    events << Event.create(properties: {
      "kind": "statement",
      "minimumSips": 2,
      "texts": ["What is the capital of France?"],
    })
    events << Event.create(properties: {
      "kind": "statement",
      "texts": ["What is the capital of France?"],
      "first": 2,
      "minimumSips": 2,
    })
    assert events.all?(&:valid?)
  end
end
