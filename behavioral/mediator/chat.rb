class Chat
  attr_accessor :users

  def initialize
    @users = []
  end

  def add_user(user)
    users << user
  end

  def send_message(message, sender)
    message += " | From #{sender.name}"
    users.each { |user| user.recieved_messages << message }
  end
end
