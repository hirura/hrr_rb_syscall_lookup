require "mkmf"

if [
  have_header("libaudit.h"),
  have_library("audit"),
].all?
  create_makefile("hrr_rb_syscall_lookup/hrr_rb_syscall_lookup")
end
