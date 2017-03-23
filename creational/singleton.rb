class Configuration
  class << self
    attr_accessor :instance

    def new
      return @instance if @instance
      puts 'Some process which run also once'
      @instance = super
    end
  end
end


configuration_1 = Configuration.new
configuration_2 = Configuration.new

puts configuration_1.object_id == configuration_2.object_id #true
