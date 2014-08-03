class ScopeType
  attr_reader :key, :name

  def initialize(key, name, generator)
    @key = key
    @name = name
  end

  def to_s
    @name
  end

  @@values = []
  @@values.append(ScopeType.new("Self", "My Self",))
  @@values.append(ScopeType.new("My Self and Spouse", "My Self and Spouse"))
  @@values.append(ScopeType.new("My Self and Children", "My Self and Children"))

  def ScopeType.values
    @@values
  end

  def ScopeType.[](key)
    @@values.each do |scope_type|
      if scope_type.key == key
        return scope_type
      end
    end
    nil
  end
end
