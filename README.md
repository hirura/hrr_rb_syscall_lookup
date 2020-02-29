# HrrRbSyscallLookup

HrrRbSyscallLookup is a library to provice system call number and name look-up functions using libaudit.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
  - [Methods](#methods)
    - [name_to_num(name)](#name_to_numname)
    - [num_to_name(num)](#num_to_namenum)
- [Development](#development)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [License](#license)

## Requirements

HrrRbSyscallLookup requires the following is available on the system.

- libaudit

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hrr_rb_syscall_lookup'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hrr_rb_syscall_lookup

## Usage

The basic usage for the library is as follows.

```ruby
require "hrr_rb_syscall_lookup"

hello = "hello\n"
syscall HrrRbSyscallLookup.name_to_num("write"), $stdout.fileno, hello, hello.size
# hello
```

### Methods

#### name_to_num(name)

The name_to_num(name) method translates a system call name into a number that the name indicates based on the running machine.

```ruby
HrrRbSyscallLookup.name_to_num("write")
# => 1 # on my machine
```

The method takes an argument name that is an instance of String.

When the machine has the system call, the method returns a number, which an instance of Integer, that the name indicates.

When the machine does not have the system call, the method returns nil.

When the argument is not an instance of String, the method raises TypeError.

#### num_to_name(num)

The num_to_name(num) method translates a system call number into a name that the number indicates based on the running machine.

```ruby
HrrRbSyscallLookup.num_to_name(1)
# => write # on my machine
```

The method takes an argument num that is an instance of Integer.

When the machine has the system call, the method returns a name, which an instance of String, that the num indicates.

When the machine does not have the system call, the method returns nil.

When the argument is not an instance of Integer, the method raises TypeError.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hirura/hrr_rb_syscall_lookup. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/hirura/hrr_rb_syscall_lookup/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HrrRbSyscallLookup project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hirura/hrr_rb_syscall_lookup/blob/master/CODE_OF_CONDUCT.md).
