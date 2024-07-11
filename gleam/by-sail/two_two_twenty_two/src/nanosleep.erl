-module(nanosleep).
-export([system_nanotime/0]).

system_nanotime() ->
    erlang:system_time(nanosecond).
