# Seed data for development environment

unless Rails.env.production?
  themes = [
    Theme.create(name: "InTeam Golio mode"),
    Theme.create(name: "Les Beuteu du NIST")
  ]

  [
    Event.create(properties: {
      "kind": "statement",
      "sips": 2,
      "texts": ["Shit on the roof of the building of drink {sips}."],
    }),
    Event.create(properties: {
      "kind": "curse",
      "texst": ["Talk like Elastchin from now."]
    })
  ].each do |event|
    event.themes += themes
  end

  # Only contains the implemented events
  playable = Theme.create(name: 'Gameloop test')
  events = [
    Event.create(properties: {
      "kind": "statement",
      "minimumSips": 4,
      "maximumSips": 8,
      "texts": ["Shit on the roof of the building or drink {sips}."],
    }),
    Event.create(properties: {
      "kind": "statement",
      "texts": ["Give a sip if you kissed a member of the InTeam."]
    }),
    Event.create(properties: {
      "kind": "statement",
      "texts": ["Finish your drink if you had sex with a member of the InTeam."]
    }),
    Event.create(properties: {
      "kind": "statement",
      "texts": ["{player_A}, finish {player_B} drink", "{player_B} give twice sips next time."]
    }),
    Event.create(properties: {
      "kind": "curse",
      "texts": [
        "{player_A} speak english only from now.",
        "{player_A} you don't speak english anymore"
      ],
      "first": 1,
      "turns": 3
    })
  ]
  events += [
    Event.create(properties: {
      "kind": "statement",
      "texts": ["remplissage"]
    })] * 10
  events.each do |event|
    event.themes << playable
  end
end