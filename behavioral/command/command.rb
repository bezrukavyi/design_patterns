class Command
  def execute
    raise NotImplementedError
  end

  def unexecute
    raise NotImplementedError
  end
end
