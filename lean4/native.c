#include <lean/lean.h>
#include <unistd.h>

extern lean_obj_res l_usleep(lean_obj_arg x) {
  uint64_t usec = lean_unbox_uint64(x);
  usleep(usec);
  return lean_io_result_mk_ok(lean_box(0));
}
