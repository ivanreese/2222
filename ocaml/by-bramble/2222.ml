let print_and_wait word = print_endline word ; Unix.sleepf 0.6039604

let words_file = In_channel.open_text "2222.txt"
let words = In_channel.input_lines words_file

let _ = List.iter print_and_wait words
