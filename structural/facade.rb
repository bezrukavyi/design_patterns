require 'etc'

class Account
  attr_reader :card_balance

  def initialize(starting_balance = 0)
    @card_balance = starting_balance
  end

  def replenish(amount)
    @card_balance += amount
  end

  def forward(amount)
    @card_balance -= amount
  end
end


class AccountProtectionProxy

  attr_reader :account, :owner_name

  def initialize(account, owner_name)
    @account = account
    @owner_name = owner_name
  end

  def replenish(amount)
    check_access
    account.replenish(amount)
  end

  def forward(amount)
    check_access
    account.forward(amount)
  end

  def check_access
    return if some_service == owner_name
    raise "Illegal access: #{some_service} cannot access account."
  end

  def some_service
    Etc.getlogin
  end
end

account = Account.new(100)
proxy = AccountProtectionProxy.new(account, 'Yaroslav')
proxy.replenish(10) #110
