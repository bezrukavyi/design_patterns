class Observer
  def update(user)
    puts("#{user.name} changed his status! | from #{self.class}")
    puts("His status is now #{user.status}! | from #{self.class}")
  end
end

class Notification < Observer
end

class Account < Observer
end
