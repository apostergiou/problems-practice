# Extending Ruby

A simple ruby extension, using C.

## Instructions

- Create a Makefile to build the extension.

```shell
$ ruby extconf.rb
```

- Compile and install the Extension

```shell
$ make && make install
```

- Test it!

```shell
$ irb

irb(main):001:0> require 'greet'      # => true
irb(main):002:0> Greet::Printer.speak # => "Hello world!"
```
## Guide

[Creating Extension Libraries for Ruby](https://github.com/ruby/ruby/blob/trunk/doc/extension.rdoc)
