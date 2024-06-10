# Seed data for development environment

unless Rails.env.production?
  themes = [
    Theme.create(name: "InTeam Golio mode"),
    Theme.create(name: "Les Beuteu du NIST")
  ]

  [Event.create(properties: {
    "kind": "statement",
    "sips": 2,
    "texts": ["Shit on the roof of the building of drink {sips}."],
  }),
  Event.create(properties: {
    "kind": "curse",
    "texst": ["Talk like Elastchin from now."]
  })].each do |event|
    event.themes += themes
  end
end

# Only contains the implemented events
playable = Theme.create(name: 'Gameloop test')
[Event.create(properties: {
  "kind": "statement",
  "sips": 2,
  "texts": ["Shit on the roof of the building of drink {sips}."],
}),
Event.create(properties: {
  "kind": "statement",
  "texts": ["Give a sip if you kissed a member of the InTeam."]
}),
Event.create(properties: {
  "kind": "statement",
  "texts": ["Finish your drink if you had sex with a member of the InTeam."]
})].each do |event|
  event.themes << playable
end