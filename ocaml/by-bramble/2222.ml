let print_and_wait word =
  print_string word ;
  flush stdout ;
  Unix.sleepf 0.6039604 ;
  print_string "\b\b\b\b" ;
  flush stdout

let words_from filename =
  let words_file = In_channel.open_text filename in
  let to_ret = In_channel.input_lines words_file in
  let _ = In_channel.close words_file in
  to_ret

let _ = List.iter print_and_wait (words_from "2222.txt")
