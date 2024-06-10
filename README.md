# CHOCOLO

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

## Questions specs

Look at `./config/schemas/event.json` to change the specification of the questions.

## Testing

Not much to see here, eventually coverage and more will be added.

```
rails test
```

## To cover in the future

* Formatting
* Configuration
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

