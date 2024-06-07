# Seed data for development environment

themes = [
  Theme.create(name: "InTeam Golio mode"),
  Theme.create(name: "Les Beuteu du NIST")
]

[Question.create(properties: {
  "kind": "simple",
  "sips": 2,
  "primaryText": "Shit on the roof of the building of drink {sips}.",
}),
Question.create(properties: {
  "kind": "effect",
  "primaryText": "Talk like Elastchin from now."
})].each do |question|
  question.themes += themes
end

# Only contains the implemented questions
playable = Theme.create(name: 'Gameloop test')
[Question.create(properties: {
  "kind": "simple",
  "sips": 2,
  "primaryText": "Shit on the roof of the building of drink {sips}.",
}),
Question.create(properties: {
  "kind": "simple",
  "primaryText": "Give a sip if you kissed a member of the InTeam."
}),
Question.create(properties: {
  "kind": "simple",
  "primaryText": "Finish your drink if you had sex with a member of the InTeam."
})].each do |question|
  question.themes << playable
end