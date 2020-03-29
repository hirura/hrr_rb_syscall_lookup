#include <limits.h>
#include <libaudit.h>
#include "hrr_rb_syscall_lookup.h"

VALUE rb_mHrrRbSyscallLookup;

VALUE
hrr_rb_syscall_lookup_name_to_num(VALUE self, VALUE name)
{
  int rc;
  Check_Type(name, T_STRING);
  rc = audit_name_to_syscall(StringValueCStr(name), audit_detect_machine());
  if (rc < 0)
    return Qnil;
  return INT2FIX(rc);
}

VALUE
hrr_rb_syscall_lookup_num_to_name(VALUE self, VALUE num)
{
  const char* name;
  if (RB_TYPE_P(num, T_BIGNUM))
    return Qnil;
  Check_Type(num, T_FIXNUM);
  if (FIX2LONG(num) < (long)INT_MIN || (long)INT_MAX < FIX2LONG(num))
    return Qnil;
  name = audit_syscall_to_name(FIX2INT(num), audit_detect_machine());
  if (name == NULL)
    return Qnil;
  return rb_str_new_cstr(name);
}

void
Init_hrr_rb_syscall_lookup(void)
{
  rb_mHrrRbSyscallLookup = rb_define_module("HrrRbSyscallLookup");
  rb_define_singleton_method(rb_mHrrRbSyscallLookup, "name_to_num", hrr_rb_syscall_lookup_name_to_num, 1);
  rb_define_singleton_method(rb_mHrrRbSyscallLookup, "num_to_name", hrr_rb_syscall_lookup_num_to_name, 1);
}
