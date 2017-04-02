require 'pry'
require_relative 'chat'
require_relative 'user'

chat = Chat.new
bob = User.new('Bob', chat)
steve = User.new('Steve', chat)
john = User.new('John', chat)

bob.send_message('Message for Steve and John')
puts steve.recieved_messages # Message for Steve and John | From Bob
puts john.recieved_messages # Message for Steve and John | From Bob
steve.read_messages
john.read_messages

steve.send_message('Message for Bob and John')
puts bob.recieved_messages # Message for Bob and John | From Steve
puts john.recieved_messages # Message for Bob and John | From Steve
