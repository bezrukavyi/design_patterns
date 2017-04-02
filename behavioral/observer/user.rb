class User
  include ObserverManager

  attr_reader :name
  attr_accessor :status

  def initialize(name, status)
    super()
    @name = name
    @status = status
  end

  def status=(value)
    @status = value
    notify_observers
  end
end
