# ansi_color

Add some simple methods that allow you to colourise and style your Strings with lovely Ruby syntactic sugar.

## Examples

	require 'rubygems'
	require 'ansi_color'
	
	AnsiColor.print('plain string')
	# => "plain string"
	
	AnsiColor.puts('plain string')
	# => "plain string\n"
	
	AnsiColor.print('coloured string', :color => :red,
		:background => :black,
		:effects => [:blink, :bold])
	# => "\e[31;40;5;1mcoloured string\e[0m"
	
	AnsiColor.puts('coloured string', :color => :red,
		:background => :black,
		:effects => [:blink, :bold])
	# => "\e[31;40;5;1mcoloured string\e[0m\n"
	
	AnsiColor.red
	# => 31
	
	AnsiColor.red_background
	# => 41
	
	AnsiColor.blink
	# => 5

## Adding colour methods to String

### This doesn't work properly!

Chaining methods works but isn't particularly ingenious.

	require 'rubygems'
	require 'ansi_color'
	
	class String
		include AnsiColor::String
	end
	
	'coloured string'.red.bold.blink
	# => "\e[5m\e[1m\e[31mcoloured string\e[0m\e[0m\e[0m"
