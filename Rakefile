require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("hrr_rb_syscall_lookup") do |ext|
  ext.lib_dir = "lib/hrr_rb_syscall_lookup"
end

task :default => [:clobber, :compile, :spec]
