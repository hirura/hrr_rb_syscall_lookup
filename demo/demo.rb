require "hrr_rb_syscall_lookup"

puts "System call number of write:"
puts HrrRbSyscallLookup.name_to_num("write")

puts

puts "System call name of 1:"
puts HrrRbSyscallLookup.num_to_name(1)

puts

hello = "hello\n"
syscall HrrRbSyscallLookup.name_to_num("write"), $stdout.fileno, hello, hello.size
# => hello
