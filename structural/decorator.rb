class CustomDecorator
  attr_reader :decorated_object

  def self.decorate
    decorator_class = self
    object_class = self.name.gsub('Decorator', '')
    Object.const_get(object_class).class_eval do
      define_method(:decorate) do
         @decorate ||= decorator_class.new(self)
      end
    end
  end

  def initialize(object)
    @decorated_object = object
  end

  def method_missing(method_sym, *arguments, &block)
    return super unless decorated_object.respond_to?(method_sym, :public)
    decorated_object.send(method_sym)
  end
end


class User
  attr_accessor :first_name, :last_name

  def initialize(options)
    @first_name = options[:first_name]
    @last_name = options[:last_name]
  end
end

class UserDecorator < CustomDecorator
  decorate

  def full_name
    [first_name, last_name].join(' ')
  end
end

user = User.new(first_name: 'First', last_name: 'Last')
user_decorator = UserDecorator.new(user).full_name # First Last
user.decorate.full_name # First Last
