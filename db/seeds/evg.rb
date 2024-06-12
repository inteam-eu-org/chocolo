# Seed data for development/staging environment

evg = Theme.create(name: 'Paul EVG - alpha')
events = []
# distribue si
[
  "tu n'as pas eu un rapport dans les 5 derniers jours (peuchère).",
  "tu es plus petit que Paulo.",
  "tu as un début de calvitie.",
  "tu en as une plus petite que Paulo.",
  "tu es déjà allé au Havre.",
  "tu fais partie de l'inTeam.",
  "tu as été au BDE.",
  "tu as déjà fait une soirée avec Paul.",
  "tu es meilleur au beer-pong que Paul.",
  "tu n'as jamais fait de strip-tease.",
  "tu es celui ou celle qui a le moins d'ex.",
  "tu es celui ou celle qui se couche en premier en soirée.",
  "tu es célibataire. Force à vous les frères et les soeurs.",
].each do |s|
  events << Event.create(properties: {
    "kind": "statement",
    "texts": ["Distribue {sips} si #{s}"],
    "minimumSips": 1,
    "maximumSips": 3,
  })
end
# prends si
[
  "tu as déjà rompu avec quelqu'un par sms, sinon distribue-les.",
  "tu as déjà vu le cul de Paulo.",
  "tu es déjà allé au Havre (mets du respect).",
  "tu fais partie de l'inTeam.",
  "tu as été au BDE.",
  "tu t'appelles Paul (cadeau).",
  "tu as déjà joué au foot avec Paul.",
  "Paul t'as déjà vu nu.",
  "tu es celui ou celle avec la plus longue relation.",
  "tu as déjà utilisé une application de rencontres.",
  "tu es celui ou celle qui se couche en dernier en soirées.",
  "tu as été champion de France minimes de basket.",
  "tu aimes Excel."
].each do |s|
  events << Event.create(properties: {
    "kind": "statement",
    "texts": ["Prends {sips} si #{s}"],
    "minimumSips": 1,
    "maximumSips": 3,
  })
end
# categories
[
  "\"Au revoir\" dans une autre langue que le francais.",
  "Les pays qui ont gagné l'euro.",
  "Anecdotes concernant Paulo.",
  "Les phrases cultes de Paulo, celui-ci doit valider.",
  "Les joueurs de basket (actuels ou retraités).",
  "Les endroits insolites où Paulo a déjà dormi."
].each do |s|
  events << Event.create(properties: {
    "kind": "statement",
    "texts": ["#{s} Le joueur qui ne trouve pas ou répète prend {sips}. {player_A} commence."],
    "minimumSips": 2,
    "maximumSips": 5,
  })
end
# defis
[
  "Fais une blague ! Les autres votent si elle est réussie ou non. // Ceux qui ont voté non boivent {sips} gorgées.",
  "Tataki.. c'est la tata de qui ? Votez ! // La nièce ou le neveu boit {sips} gorgées.",
  "Danse sur une musique de ton choix pendant au moins 20 secondes et distribue {sips} gorgées, ou bois-les.",
  "2 personnes montrent leur cul à Paulo (il adore ca), il choisit le plus beau qui donnera à boire.",
  "{player_A} prépare deux shots et donnes-en un à Paul. Santé !",
  "{player_A} cours dans un champ nu (ou en sous-vêtements) pendant 30 secondes ou bois {sips} gorgées.",
  "{player_A}, {sips} personnes te préparent un shot chacune, ou bois le double de gorgées.",
  "{player_A} chante une chanson pendant 20 secondes ou bois {sips} gorgées.",
  "{player_A} appelle quelqu'un et déclare lui ton amour ou bois {sips} gorgées.",
  "{player_A} fais un tour de la maison en sous-vêtements ou bois {sips} gorgées.",
  "{player_A} donne autant de compliments sincères à {player_B} que tu veux. {player_B} boit autant de gorgées que de compliments reçus.",
  "{player_A} fais 10 pompes ou bois {sips} gorgées.",
  "{player_A} fais 20 squats ou bois {sips} gorgées.",
  "{player_A} tu dois marquer un lancer-franc ! Bois autant de gorgées que de ratés.",
  "{player_A} tu dois marquer le dernier verre d'une partie de beer-pong ! Bois autant de gorgées que de ratés.",
  "{player_A} fais un bisou sur la joue de chaque joueur ou bois autant de gorgées qu'il y a de joueurs.",
  "{player_A} fais un cul sec d'une pinte d'eau, ou bois un shot d'alcool pur.",
  "{player_A} et {player_B}, échangez un de vos vêtements. // {player_A} et {player_B} vous pouvez ré-échanger vos vêtements.",
  "A tour de rôle, mimez une expression française de votre choix. Votez pour la meilleure ! // Le vainqueur distribue {sips} gorgées.",
  "Faites un cache-cache tout nu. Paul cherche-les et mets-leur une carotte dans le cul quand tu les retrouves. Ou buvez tous {sips} gorgées.",
  "{player_A} pense à un chiffre entre 1 et 10 et imite le bruit d'un klaxon correspondant à cette intensité. Les autres joueurs doivent deviner ton chiffre. // Buvez autant de gorgées que vous êtes éloignés du bon chiffre.",
  "{player_A} pense à un chiffre entre 1 et 10 et mime une chute à vélo correspondant à cette intensité. Les autres joueurs doivent deviner ton chiffre. // Buvez autant de gorgées que vous êtes éloignés du bon chiffre.",
  "{player_A} pense à un chiffre entre 1 et 10 et fais une célébration de but correspondant à cette intensité. Les autres joueurs doivent deviner ton chiffre. // Buvez autant de gorgées que vous êtes éloignés du bon chiffre.",
  "A tour de rôle, imitez Paul. Votez pour la PIRE imitation. // Paul donne un nombre de gorgées de ton choix au loser."
].each do |s|
  events << Event.create(properties: {
    "kind": "statement",
    "texts": s.split(' // '),
    "minimumSips": 3,
    "maximumSips": 6,
  })
end
# plutot
[
  "JägerBomb (en haut) ou Captain Coca (en bas) ?",
  "Vacances reposantes (en haut) ou faire 100km en voiture par jour (en bas) ?",
  "Basket (en haut) ou foot (en bas) ?",
  "Beyoncé (en haut) ou LMFAO (en bas) ?",
  "Le HAC (en haut) ou le Metz Basket Club (en bas) ?",
  "Excel (en haut) ou Word (en bas) ?",
  "Marco (en haut) ou Paulo (en bas) ?"
].each do |s|
  events << Event.create(properties: {
    "kind": "statement",
    "texts": ["Plutôt #{s} {sips} gorgées pour les perdants."],
    "minimumSips": 2,
    "maximumSips": 6,
  })
end
# malediction
[
  "{player_A} et {player_B} sont mariés et prennent le meme nombre de gorgées. // {player_A} et {player_B} divorcent.",
  "{player_A} n'a plus le droit de boire de la main dominante. // {player_A} peut reboire comme il veut.",
  "{player_A} ne peut plus répondre que par oui ou par non. // {player_A} peut reprendre une conversation normale.",
  "On ne peut parler à {player_A} qu'avec des questions. // On peut reparler normalement à {player_A}.",
  "{player_A} ne peut plus que vouvoyer. // {player_A} peut reparler normalement.",
  "{player_A} ne peut plus parler qu'en posant des questions. // {player_A} peut reparler normalement.",
  "Dès que {player_A} rigole, tout le monde doit rire aussi et le dernier à rire boit. // {player_A} n'a plus d'humour (vraiment pas marrant).",
  "{player_A} est un(e) tuche. Tu peux oublier une fois que tu es un tuche, mais pas 15... // {player_A} n'est plus un(e) tuche, juste un(e) idiot(e).",
].each do |s|
  events << Event.create(properties: {
    "kind": "curse",
    "texts": s.split(' // '),
    "turns": rand(5..15),
    "first": 1
  })
end


events.each do |event|
  event.themes << evg
end


unless Rails.env.production?
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

  # Other palceholders
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
end