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
end