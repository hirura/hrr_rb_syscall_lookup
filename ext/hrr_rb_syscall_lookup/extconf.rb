require "mkmf"

if [
  have_header("libaudit.h"),
  have_library("audit"),
  have_library("audit", "audit_name_to_machine"),
  have_library("audit", "audit_name_to_syscall"),
  have_library("audit", "audit_syscall_to_name"),
].all?
  create_makefile("hrr_rb_syscall_lookup/hrr_rb_syscall_lookup")
end
