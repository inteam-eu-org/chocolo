# CHOCOLO

Bootleg Picolo app, with custom questions!

## Development

### Install

The project is being made with ruby 3.3.1.

I recommend using [asdf](https://asdf-vm.com) to always have the proper Ruby version loaded.

It has no specific deps other than a few gems:

`bundle i`

### Run

`bin/dev`

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

## To cover in the future

* Configuration

* Database creation

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

