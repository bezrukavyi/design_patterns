module ObserverManager
  attr_accessor :observers

  def initialize
    @observers = []
  end

  def add_observer(observer)
    self.observers << observer
  end

  def delete_observer(observer)
    self.observers.delete(observer)
  end

  def notify_observers
    self.observers.each { |observer| observer.update(self) }
  end
end
