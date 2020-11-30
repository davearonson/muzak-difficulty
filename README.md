This is code I'm having trouble mutation testing with muzak.

The code runs fine in iex or when called from other code, the tests run fine when I do mix test (whether or not I comment out the "real" tests so as to let some mutants survive), but when I do mix muzak I get:

> `(RuntimeError) cannot capture_log/2 because the :logger application was not started.`

This is coming from ExUnit, not Muzak, but since the tests run fine without Muzak I’m thinking it may be something Muzak is doing or assuming – such as something that I, an Elixir semi-n00bie, didn’t know I was supposed to do.  I’m guessing it’s due to the difference between having a whole application per se, with an OTP supervision tree including a logger app and all that, versus just some code, which is what I’m trying to do to keep it very simple.

Gory details:

- Call stack:

  ```
  (ex_unit 1.11.2) lib/ex_unit/capture_log.ex:99: ExUnit.CaptureLog.add_capture/2
  (ex_unit 1.11.2) lib/ex_unit/capture_log.ex:70: ExUnit.CaptureLog.capture_log/2
  (muzak 1.0.2) lib/muzak/runner.ex:202: Muzak.Runner.run_silent/1
  (muzak 1.0.2) lib/muzak/runner.ex:37: Muzak.Runner.run_mutation/3
  (muzak 1.0.2) lib/muzak/runner.ex:15: anonymous fn/4 in Muzak.Runner.run_test_loop/2
  (elixir 1.11.2) lib/enum.ex:2181: Enum."-reduce/3-lists^foldl/2-0-"/3
  (muzak 1.0.2) lib/muzak/runner.ex:13: Muzak.Runner.run_test_loop/2
  (muzak 1.0.2) lib/muzak.ex:7: Muzak.run/1
  ```

- Googling the error message gets me absolutely nothing other than the PR to ExUnit where that message was put in place.  It seemed too much digging to figure out what the error message may have been before that, so as to Google it, but since the PR was merged 2017-10-07 I figured relevant results would be fairly likely to be recent.

- I tried all the relevant-seeming things I could find or think of, mainly:

  - adding capture_log: false to the ExUnit.start() in test_helper.exs
  - putting config :conway, disable_logging: true in test.config
  - removing :logger from extra_applications in mix.exs
  - adding env: [ capture_log: false] in def application in mix.exs

  (Unfortunately I’m still not very familiar with the intricacies of mix.exs.)

I’ve been learning Elixir for years now in my Copious Free Time, and one of the things putting a big dent in my CFT lately is, ironically enough . . . playing with mutation testing.  :-)
