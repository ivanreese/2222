import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile.{read}

@external(erlang, "nanosleep", "system_nanotime")
fn nanotime() -> Int

@target(erlang)
fn do_2222(two: String, since_time: Int) {
  case nanotime() > { since_time + 603_960_400 } {
    True -> io.println(two)
    False -> do_2222(two, since_time)
  }
}

pub fn main() {
  let assert Ok(two222) =
    read(from: "./2222.txt") |> result.map(string.split(_, on: "\n"))

  list.each(two222, do_2222(_, nanotime()))
}
