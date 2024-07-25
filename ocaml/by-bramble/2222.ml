let print_and_wait word =
  print_endline word ;
  flush stdout ;
  Unix.sleepf 0.6039604

let print_and_wipe word =
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

let get_opts () =
  let usage_msg = "2222 [options] [<words-file>]" in
  let shuffle = ref false and in_place = ref false in
  let words_filepath = ref "2222.txt" in
  let speclist = [
    ("-s", Arg.Set shuffle, "randomise the order of words");
    ("-i", Arg.Set in_place, "each word overwrites the previous word in-place");
  ] in
  let () = Arg.parse speclist ((:=) words_filepath) usage_msg in
  (!shuffle, !in_place, !words_filepath)

let shuffle_list l =
  let arr = Array.of_list l in
  let len = Array.length arr in
  for i = len - 1 downto 1 do
    let j = Random.int (i + 1) in
    let swp = arr.(i) in
    arr.(i) <- arr.(j) ;
    arr.(j) <- swp
  done ;
  Array.to_list arr

let () =
  let (shuffle, in_place, words_filepath) = get_opts () in
  let words = words_from words_filepath in
  let words = if shuffle then
    shuffle_list words
  else
    words
  in
  if in_place then
    List.iter print_and_wipe words
  else
    List.iter print_and_wait (words_from "2222.txt")
