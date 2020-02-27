#include "hrr_rb_syscall_lookup.h"

VALUE rb_mHrrRbSyscallLookup;

void
Init_hrr_rb_syscall_lookup(void)
{
  rb_mHrrRbSyscallLookup = rb_define_module("HrrRbSyscallLookup");
}
