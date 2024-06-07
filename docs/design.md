# Chocolo - Game Design

By [InTeam](https://inteam.eu.org) for a friend's wedding and hopefully more. [Credits to Thor](https://www.develop.games) for sharing a Game Design document example.

## Table of contents

1. [Introduction](#introduction)
    1. [Game Summary](#game-summary)
    2. [Inspiration](#inspiration)
    3. [Player Experience](#player-experience)
    4. [Platform](#platform)
    5. [Development Software](#development-software)
    6. [Genre](#genre)
  7. [Target Audience](#target-audience)
2. [Concept](#concept)
    1. [Gameplay overview](#gameplay-overview)
    2. [Additional features](#additional-features)
3. [Art](#art)
4. [Audio](#audio)
    1. [Music](#music)
    2. [Sound Effects](#sound-effects)
5. [Game UI](#game-ui)
6. [Development Timeline](#development-timeline)

## Introduction

### Game Summary

**Chocolo** is a Picolo clone, which allows users to create and save their own
custom themes.

### Inspiration

#### Picolo

Picolo is a drinking-game app which displays a series of prompts for the players to read aloud and follow. It can be questions, votes, orders, challenges, anything that can be easily done in a living room during a party.

#### Our growing frustation

While Picolo is nice, it lacks what we think could be amazing features, such as being able to plant very specific challenges during a game. The ability to customize a game would be a great addition for this game, what that is what we plan to bring.

### Player Experience

The first step is to register the players and to select the game mode, or **theme**.
Then, the game starts: a sentence pops in the middle of the screen, the player holding the phone reads it aloud, then all the players must comply to what was said. Tap on the screen to move on to the next sentence.

### Platform

Browser on phones for the prototype. Eventually an Electron or similar app?

### Development Software

- Your favorite text editor or IDE
- `asdf` for handling ruby/etc versions
- **TBD** for the graphics and UI
- **TBD** for the music and SFX

### Genre

Multiplayer, party, alcohol

### Target Audience

Friends first, eventually releasing publicly would be a great achievement. Any
group of adults can play the game.

## Concept

### Gameplay overview

Sit down in a circle. Listen to the player holding the phone. Have fun!

### Additional features

Moreover, we would like to add accounts, which would allow to save and retrieve your custom themes.

The ability to create different kinds of **sentences** (effects lasting for a few turns, double-edged choices, pairing people together, you name it!) would help increasing the diversity of the themes and make each game unique.

## Art

I am usually bad at this and will need help. What do we want to build?

## Audio

### Music

I'm thinking of a piped music, I would love to try to do it myself!

### Sound Effects

Depending on the kind of sentence (if a lot of sips are in play, if a player is freed from a curse, ...), could be fun to add a few SFX for each. Also when clicking buttons, and whatever UI thing we build in the future.

## Game UI

The screen has an immutable header (title of the game, login/disconnect and "My themes" buttons), and a disposable footer (click to hide).

All the elements are built on a single page, and are hidden/shown when relevant.

The game creation page has a form for filling the players names and choosing the theme to play. It also has a button to start the game with the provided data.

The game itself is just a sentence in the middle of the screen which is updated whenever someone clicks on the screen.

## Development Timeline

**PROTOTYPE**

| # | Assignment | Type | Status | Finish By | Notes |
|---|------------|------|--------|-----------|-------|
| 1 | Design document | Other | Finished | Jun 7 | n/a |
| 2 | Gameloop | Coding | Finished | Jun 7 | prototype for fast dev |
| 3 | Background (piped) musics | Audio | Not started | ? | ta-ta ta-da-la |
| 4 | UI / Main menus graphics | Art | Not started | ? | need to define the general graphical theme first |
| 5 | Finish implementing all sentence kinds | Coding | Not started | ? | cf technical doc |
| 6 | Password-less login | Coding | Not started | ? | backend + mailer + UI screens |
| 7 | Create a custom theme | Coding | Not started | ? | |
| 8 | Share a custom theme | Coding | Not started | ? | |
| 9 | Sound effects | Audio | Not started | ? | On UI click, and after changing sentence |
| 10 | Hosted on inteam.eu.org | Admin | Not started | ? | config auto-renew certs, dnssec, double-check everything |
