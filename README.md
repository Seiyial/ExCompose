# Excompose

A library for composing XLSX files based off templates, with full support of template styling.

## Installation

Add `ex_compose` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_compose, "~> 0.2.0"}
  ]
end
```

## Usage

### Setup

#### Application Config
```elixir
# config.exs
config :ex_compose,
	tmp_dir: "tmp", # should be relative to project root
	time_zone: {8, "Asia/Singapore"}
```
`tmp_dir`: the relative path to a folder from your project root. That folder will be the working directory for `ex_compose`.
e.g. if your project is at `/Users/MOI/workspace/my_app`, and `tmp_dir` is set to `temp`, ex_compose will work in the folder `/Users/MOI/workspace/my_app/tmp_dir`.
`time_zone`: `ex_compose` for logging and operating purposes. Input `{tz_offset, iana_time_zone}`, where `tz_offset` is an integer or float for the number of hours of offset for your server's time zone, and `iana_time_zone` is the country time zone code. This will be used to timestamp the working files.

### Write XLSX Files

```elixir


ExCompose.write_xlsx(%{})

