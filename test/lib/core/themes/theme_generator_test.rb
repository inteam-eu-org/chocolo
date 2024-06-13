require "test_helper"

class ThemeGeneratorTest < ActiveSupport::TestCase
  test "the validity of theme sentences substitution" do
    # Fake data
    events = [
      Event.create(properties: {
        "kind": "statement",
        "minimumSips": 2,
        "maximumSips": 5,
        "texts": ["Drink {sips}."],
      }), Event.create(properties: {
        "kind": "statement",
        "texts": ["{player_A} finish your drink."],
      })
    ]
    theme = Theme.create(name: "Test theme")
    events.each do |event|
      event.themes << theme
    end

    # Game players
    players = ["Alice", "Bob", "Charlie"]

    sentences = Core::Themes::ThemeGenerator.generate(theme, players)

    assert sentences.any? { |s| /^Drink [2-5]\.$/.match? s }
    assert sentences.any? { |s| /^(Alice)|(Bob)|(Charlie) finish your drink\.$/.match? s }
  end

  test "the validity of cursed events" do
    # Fake data
    first_sentence = "The player facing the GM can't speak French anymore."
    third_sentence = "Tu peux reparler francais."
    second_sentence = "GM finish your drink."
    events = [
      Event.create(properties: {
        "kind": "curse",
        "texts": [
          first_sentence,
          third_sentence
        ],
        "first": 1,
        "turns": 1
      }), Event.create(properties: {
        "kind": "statement",
        "texts": [second_sentence],
      })
    ]
    theme = Theme.create(name: "Test theme")
    events.each do |event|
      event.themes << theme
    end

    sentences = Core::Themes::ThemeGenerator.generate(theme, [], shuffle: false)

    assert sentences.first == first_sentence
    assert sentences[1] == second_sentence
    assert sentences.last == third_sentence
  end

  test "the futures are being emptied at the end of the game (useless)" do
    # Fake data
    events = [
      Event.create(properties: {
        "kind": "curse",
        "texts": ["zgeg", "testos"],
        "first": 1,
        "turns": 10
      }), Event.create(properties: {
        "kind": "statement",
        "texts": ["Drink."],
      })
    ]
    theme = Theme.create(name: "Test theme")
    events.each do |event|
      event.themes << theme
    end

    sentences = Core::Themes::ThemeGenerator.generate(theme, [], shuffle: false)

    assert sentences.first == "zgeg"
    assert sentences[1] == "Drink."
    assert sentences.last == "testos"
  end
end