@[extern "my_usleep"]
opaque usleep : UInt64 -> IO Unit

def main := do
  let words <- IO.FS.lines "../../2222.txt"
  words.forM (fun word => do
    IO.println word
    usleep 603960 -- This is a serious game. Math matters.
    -- The pause is 400nsec shorter to compensate for the print time.
  )
