module InstanceCounter
  include InstanceMethods
  extend ClassMethods


  module ClassMethods
    def instances
      @instances = 0
    end

    def add_instance
      @instances += 1
    end
  end

  module InstanceMethods

    private

    def register_instance
      self.class.add_instance
    end
  end
end