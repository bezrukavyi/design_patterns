require 'pry'
require_relative 'observer_manager'
require_relative 'observer'
require_relative 'user'

notific_observer = Notification.new
account_observer = Account.new
user = User.new('Bob', 'First status')
user.add_observer(notific_observer)
user.add_observer(account_observer)
user.status = 'Second status'
