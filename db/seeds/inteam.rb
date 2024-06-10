# Seed data for development environment

themes = [
  Theme.create(name: "InTeam Golio mode"),
  Theme.create(name: "Les Beuteu du NIST")
]

[Event.create(properties: {
  "kind": "simple",
  "sips": 2,
  "primaryText": "Shit on the roof of the building of drink {sips}.",
}),
Event.create(properties: {
  "kind": "effect",
  "primaryText": "Talk like Elastchin from now."
})].each do |event|
  event.themes += themes
end

# Only contains the implemented events
playable = Theme.create(name: 'Gameloop test')
[Event.create(properties: {
  "kind": "simple",
  "sips": 2,
  "primaryText": "Shit on the roof of the building of drink {sips}.",
}),
Event.create(properties: {
  "kind": "simple",
  "primaryText": "Give a sip if you kissed a member of the InTeam."
}),
Event.create(properties: {
  "kind": "simple",
  "primaryText": "Finish your drink if you had sex with a member of the InTeam."
})].each do |event|
  event.themes << playable
end