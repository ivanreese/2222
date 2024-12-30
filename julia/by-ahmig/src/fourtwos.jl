module fourtwos

using Random

function parse_time(time_str::String)::Float64
    time::Vector{String} = split(split(time_str, "=")[2], ":")
    minutes::String = get(time, 1, "0")
    seconds::String = get(time, 2, "0")
    parse(Float64, minutes) * 60 + parse(Float64, seconds)
end

function parse_sleep_arg()::Float64
    time::Float64 = 22*60 + 22
    for arg in ARGS
        if startswith(arg, "time=")
            time = parse_time(arg)
        end
    end
    time / 2222
end

function read_words(shuffle::Bool)::Vector{String}
    words = readlines("2222.txt")
    if shuffle
        shuffle!(words)
    end
    words
end

function run()
    sleep_time::Float64 = parse_sleep_arg()
    wait_word() = if "manual" in ARGS readline() else sleep(sleep_time) end
    print_word(iword) = if "numbered" in ARGS println("[$(iword[1])] $(iword[2])") else println(iword[2]) end
    for iword in enumerate(read_words("shuffle" in ARGS))
        print_word(iword)
        wait_word()
    end
end

export run

end # module fourtwos
