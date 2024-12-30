module fourtwos

using Random

const SLEEP::Float64 = 0.6039604

function read_words(shuffle::Bool)
    words = readlines("2222.txt")
    if shuffle
        shuffle!(words)
    end
    words
end

function run()
    wait_word() = if "manual" in ARGS readline() else sleep(SLEEP) end
    for word in read_words("shuffle" in ARGS)
        println(word)
        wait_word()
    end
end

export run

end # module fourtwos
