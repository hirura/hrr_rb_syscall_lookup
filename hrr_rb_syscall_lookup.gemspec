require_relative 'lib/hrr_rb_syscall_lookup/version'

Gem::Specification.new do |spec|
  spec.name          = "hrr_rb_syscall_lookup"
  spec.version       = HrrRbSyscallLookup::VERSION
  spec.authors       = ["hirura"]
  spec.email         = ["hirura@gmail.com"]

  spec.summary       = %q{Providing system call number and name look-up functions using libaudit.}
  spec.description   = %q{Providing system call number and name look-up functions using libaudit.}
  spec.homepage      = "https://github.com/hirura/hrr_rb_syscall_lookup"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.0.0")

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/hrr_rb_syscall_lookup/extconf.rb"]
end
