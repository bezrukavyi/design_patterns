class User
  attr_reader :name, :chat
  attr_accessor :recieved_messages

  def initialize(name, chat)
    @name = name
    @chat = chat
    @recieved_messages = []
    chat.add_user(self)
  end

  def read_messages
    self.recieved_messages = []
  end

  def send_message(message)
    chat.send_message(message, self)
  end
end
