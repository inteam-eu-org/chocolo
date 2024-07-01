# CHOCOLO

<div align="center">
  
  [![](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) ![rails workflow](https://github.com/inteam-eu-org/chocolo/actions/workflows/rails.yml/badge.svg)
  
  <img src="https://github.com/inteam-eu-org/chocolo/blob/2d1c913ddefe590df7f59759015d59bc0d5ffa5f/app/assets/images/logo.png" width="400">
</div>

Bootleg Picolo app, with custom questions! More info in the [game design document](./docs/design.md) and the [core implementation document](./docs/implementation.md).

## Development

### Install

The project is being made with ruby 3.3.1.

I recommend using [asdf](https://asdf-vm.com) to always have the proper Ruby version loaded.

It has no specific deps other than a few gems:

`bundle i`

### Setup & Run

The database is a SQLite3 file, it's more than enough.

```
bin/rails db:create db:migrate db:seed
bin/dev
```

You can select the `Gameloop test` theme to test the loop. [Update the theme](./db/seeds/inteam.rb) as long as you had new question types or features so this theme shows all possible behaviors of the app.

**N.B.:** You can connect to the dev server using your phone to see if the app renders properly. Look into the server logs:

```bash
$ bin/rails s -b 0.0.0.0
=> Booting Puma
=> Rails 7.1.3.3 application starting in development 
=> Run `bin/rails server --help` for more startup options

This is your IP: 192.168.0.36
Use it to access the app from your mobile device on the same network
For instance: http://192.168.0.36:3000  # <-- 👀 HERE

Puma starting in single mode...
* Puma version: 6.4.2 (ruby 3.3.1-p55) ("The Eagle of Durango")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 38168
* Listening on http://0.0.0.0:3000
Use Ctrl-C to stop
```

### Installation

Depending of the Operating System and the device (laptop/mobile), the installation might differ. The process is explained [here](./docs/installation.md).

### Merging changes to `main`

Your merge requests will be automatically rejected if:

- code coverage is less than 75%
- `rails test` fails
- `rubocop` fails

Integration tests are not useable yet with the CI pipeline, it may become troublesome in the future, we will see how it goes. Ping @Chocorean if you encounter this issue.

## Questions specs

Look at `./config/schemas/event.json` to change the specification of the questions.

## Testing

Run your tests with:

```bash
rails test:all
```

It will generate a code coverage report at `./coverge/index.html`. Note that your branch won't be able to be merged if tests cover less than 5% of the codebase.

You should also use rubocop to format your code:

```bash
rubocop
```

Again, your branch won't be merged if rubocop raises the slightliest issue.

## To cover in the future

* Formatting
* Configuration
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

