# frozen_string_literal: true

# Seed data for development/staging environment

evg = Theme.create(name: 'Paul EVG')
events = []
# distribue si
"tu n'as pas eu un rapport dans les 5 derniers jours (peuchère).
tu es plus petit que Paulo.
tu as un début de calvitie.
tu en as une plus petite que Paulo.
tu es déjà allé au Havre.
tu fais partie de l'inTeam.
tu as été au BDE.
tu as déjà fait une soirée avec Paul.
tu es meilleur au beer-pong que Paul.
tu n'as jamais fait de strip-tease.
tu es celui ou celle qui se couche en premier en soirées
tu es célibataire. Force à vous les frères et les soeurs.".split("\n").each do |s|
  events << Event.create(properties: {
                           "kind": 'statement',
                           "texts": ["Distribue {sips} gorgées si #{s.strip}"],
                           "minimumSips": 1,
                           "maximumSips": 3
                         })
end
# prends si
"tu as déjà rompu avec quelqu'un par sms, sinon distribue-les.
tu as déjà vu le cul de Paulo.
tu es déjà allé au Havre.
tu fais partie de l'inTeam.
tu as été au BDE.
tu t'appelles Paul. 😘
Paul t'as déjà vu nu(e).
tu es celui ou celle qui se couche en dernier en soirées.
tu as été champion de France minimes de basket.
tu fais partie des Excel-adicts.".split("\n").each do |s|
  events << Event.create(properties: {
                           "kind": 'statement',
                           "texts": ["Prends {sips} gorgées si #{s.strip}"],
                           "minimumSips": 1,
                           "maximumSips": 3
                         })
end
# categories
"\"Au revoir\" dans une autre langue que le francais.
Les pays qui ont gagné l'Euro.
Anecdotes concernant Paulo.
Les phrases cultes de Paulo, celui-ci valide.
Les endroits insolites où Paulo a déjà dormi.".split("\n").each do |s|
  events << Event.create(properties: {
                           "kind": 'statement',
                           "texts": ["#{s} Le joueur qui ne trouve pas ou répète prend {sips}. {player_A} commence."],
                           "minimumSips": 2,
                           "maximumSips": 5
                         })
end
# defis
"{player_A}, fais une blague. Les autres votent si elle est réussie ou non. // Ceux qui ont voté non boivent {sips} gorgées.
{player_A}, danses sur une musique de ton choix pendant au moins 20 secondes et distribue {sips} gorgées, ou bois-les.
{player_A} et {player_B}, montrez votre cul à Paulo (il adore ca), il choisit le plus beau à qui il donnera à boire.
{player_A}, prépares deux shots et donnes-en un à Paul. Santé !
{player_A}, cours autour des joueurs nu(e) (ou en sous-vêtements) pendant quelques secondes ou bois {sips} gorgées.
{player_A}, chantes une chanson pendant 20 secondes ou bois {sips} gorgées.
{player_A}, donnes une qualité pour chaque joueur, bois {sips} gorgées si tu échoues.
{player_A}, donnes autant de compliments sincères à {player_B} que tu veux. {player_B} boit autant de gorgées que de compliments reçus.
{player_A}, fais 20 pompes ou bois {sips} gorgées.
{player_A}, fais 20 squats ou bois {sips} gorgées.
{player_A}, tu dois marquer un lancer-franc ! Bois autant de gorgées que de ratés.
{player_A}, fais un bisou sur la joue de chaque joueur ou bois autant de gorgées qu'il y a de joueurs.
{player_A}, fais un cul sec d'une pinte d'eau, ou bois un shot d'alcool pur.
{player_A}, mimes une expression française de ton choix. Le premier qui trouve distribue {sips} gorgées.
Faites un cache-cache tout nu. Paul cherche-les et mets-leur une carotte dans le cul quand tu les retrouves. Ou buvez tous {sips} gorgées. Enfin c'est vous qui voyez...
{player_A}, défies un autre joueur au \"pour combien?\", {sips} gorgées sont en jeu.
{player_A} pense à un chiffre entre 1 et 10 et mimes une chute à vélo correspondant à cette intensité. Les autres joueurs doivent deviner ton chiffre. // Buvez autant de gorgées que vous êtes éloignés du bon chiffre.
{player_A} pense à un chiffre entre 1 et 10 et fais une célébration de but correspondant à cette intensité. Les autres joueurs doivent deviner ton chiffre. // Buvez autant de gorgées que vous êtes éloignés du bon chiffre.
À tour de rôle, imitez Paul. Votez pour la pire imitation. // Paul donne un nombre de gorgées de ton choix au loser.
{player_A}, donnes le telephone à {player_B}. // Donnes un avis impopulaire. Si tu n'arrives pas à créer la discorde, tu prends {sips} gorgées, sinon distribues-les!
{player_A}, tu es Julien Lepers. Choisis un thème, et jusqu'à nouvel ordre, tu peux poser 3 questions pour faire boire un joueur inculte. S'il trouve la réponse, c'est toi qui bois!
Élections municipales! Votez pour un maire. // Le gagnant peut distribuer un cul sec.
Dissolution de l'assemblée ! Votez pour un député. // Le gagnant distribue {sips} gorgées parmi ses électeurs.
{player_A}, choisis un mot. // Les prénoms des joueurs qui commencent par la même lettre que ce mot distribue {sips} gorgées. Bam.
{player_A}, imites un autre joueur de ton choix. Le premier qui devine distribue {sips} gorgées.
{player_A}, lances un theme de ton choix. Le premier qui ne trouve pas boit un coup.
{player_A}, lances un \"tu préfères\". La team perdante boit {sips} gorgées.
{player_A}, mimes ta position sexuelle préférée ou bois {sips} gorgées.
Du plus jeune au plus vieux, donnez votre âge. // Respect aux anciens, chacun boit la différence avec le doyen.
Du plus jeune au plus vieux, donnez votre âge. // Gen Z en force #DAB #yolo Chacun boit la différence avec le cadet du groupe.
{player_A}, lances un \"j'ai déjà/je n'ai jamais\". Ceux qui ne l'ont pas fait boivent {sips} gorgées.
Qui serait le plus susceptible d'utiliser une application de rencontre? Tout le monde vote, et le charot boit une gorgée.
Le tonneau du groupe finit son verre.
{player_A}, trouves un similitude entre plusieurs personnes. Nommes-les. Le premier qui trouve le point commun distribue {sips} gorgées.
Kamikaze ! {player_A}, choisis un joueur pour boire un shot avec toi.
{player_A}, inventes une règle.
Le Don Juan du groupe boit {sips} gorgées.
{player_A}, donnes le nom de tous les joueurs. {sips} gorgées par erreur.
{player_A}, tu es le roi du freeze jusqu'à nouvel ordre.
{player_A}, tu es le sheriff. Défies n'importe qui au \"moins que moins\" pour le mettre en prison ({sips} gorgées).
Laurence Boccolini débarque. Tout le monde, votez pour trouver le maillon faible (justification obligatoire). Celui-ci finit son verre.
Jeu du titre jusqu'à la fin de la partie: le premier qui dit titre après une phrase qui pourrait un titre de vidéo X distribue {sips} gorgées.
Jeu du doigt: le perdant finit le verre.
Nouvelle règle: chacun s'appelle par le prénom du joueur à sa droite. Une gorgée par erreur.
Concours de BITE-box… Nan je rigole!
{player_A}, mime un animal que tu baiserais bien. // {player_A}, si tu l'as vraiment fait, rends toi au poste de police le plus proche. (le cul sec est offert).
{player_A}, tu deviens Lucky Luke. Tu as trois chances de tirer sur {player_B} Dalton. S'il esquive les trois tirs avec sa tête, c'est toi qui bois.
{player_A}, fermes les yeux et fais 5 tours sur toi-même. Désignes une direction et le joueur visé boit {sips} gorgées. Si personne n'est visé, c'est pour ta pomme.".split("\n").each do |s|
  events << Event.create(properties: {
                           "kind": 'statement',
                           "texts": s.split(' // '),
                           "minimumSips": 3,
                           "maximumSips": 6
                         })
end
# plutot
[
  'JägerBomb (en haut) ou Captain Coca (en bas) ?',
  'Vacances reposantes (en haut) ou faire 100km en voiture par jour (en bas) ?',
  'Basket (en haut) ou foot (en bas) ?',
  'Beyoncé (en haut) ou LMFAO (en bas) ?'
].each do |s|
  events << Event.create(properties: {
                           "kind": 'statement',
                           "texts": ["Plutôt #{s} {sips} gorgées pour les perdants."],
                           "minimumSips": 2,
                           "maximumSips": 6
                         })
end
# malediction
"
{player_A} et {player_B} sont mariés et prennent le même nombre de gorgées. // {player_A} et {player_B} divorcent.
{player_A} n'a plus le droit de boire de la main dominante. // {player_A} peut reboire comme il veut.
{player_A} ne peut plus répondre par oui ou par non. // {player_A} peut reprendre une conversation normale.
On ne peut parler à {player_A} qu'avec des questions. // On peut reparler normalement à {player_A}.
On ne peut plus que vouvoyer. // {player_A} peut reparler normalement.
Dès que {player_A} rigole, tout le monde doit rire aussi. Le dernier à rire boit. // {player_A} n'a plus d'humour (vraiment pas marrant).
{player_A} et {player_B}, échangez un de vos vêtements. // {player_A} et {player_B} vous pouvez ré-échanger vos vêtements.
".split("\n").each do |s|
  events << Event.create(properties: {
                           "kind": 'curse',
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
                   "kind": 'statement',
                   "minimumSips": 4,
                   "maximumSips": 8,
                   "texts": ['Shit on the roof of the building or drink {sips}.']
                 }),
    Event.create(properties: {
                   "kind": 'statement',
                   "texts": ['Give a sip if you kissed a member of the InTeam.']
                 }),
    Event.create(properties: {
                   "kind": 'statement',
                   "texts": ['Finish your drink if you had sex with a member of the InTeam.']
                 }),
    Event.create(properties: {
                   "kind": 'statement',
                   "texts": ['{player_A}, finish {player_B} drink', '{player_B} give twice sips next time.']
                 }),
    Event.create(properties: {
                   "kind": 'curse',
                   "texts": [
                     '{player_A} speak english only from now.',
                     "{player_A} you don't speak english anymore"
                   ],
                   "first": 1,
                   "turns": 3
                 })
  ]
  events += [
    Event.create(properties: {
                   "kind": 'statement',
                   "texts": ['remplissage']
                 })
  ] * 10
  events.each do |event|
    event.themes << playable
  end

  # Other palceholders
  themes = [
    Theme.create(name: 'InTeam Golio mode'),
    Theme.create(name: 'Les Beuteu du NIST')
  ]

  [
    Event.create(properties: {
                   "kind": 'statement',
                   "sips": 2,
                   "texts": ['Shit on the roof of the building of drink {sips}.']
                 }),
    Event.create(properties: {
                   "kind": 'curse',
                   "texst": ['Talk like Elastchin from now.']
                 })
  ].each do |event|
    event.themes += themes
  end
end
