Pry.commands.alias_command '??', 'whereami'

%w(continue step next finish).each do |command|
  Pry.commands.alias_command command[0], command
end

Pry::Commands.command /^$/, 'repeat last command' do
  _pry_.run_command Pry.history.to_a.last
end

def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') {|f| f << str }
  str
end

def pbpaste
  `pbpaste`
end
