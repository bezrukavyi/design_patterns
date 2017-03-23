class Task
  attr_accessor :name, :parent
  attr_reader :checked

  def initialize(name)
    @name = name
    @checked = false
    @parent = nil
  end

  def check
    @checked = true
  end
end

class TaskComposite < Task
  attr_accessor :sub_tasks

  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    sub_tasks << task
    task.parent = self
  end

  def check
    super
    sub_tasks.map(&:check)
  end
end

composet = TaskComposite.new('Task composet')
5.times do |index|
  composet.add_sub_task(Task.new("Task #{index}"))
end

puts composet.sub_tasks.all?(&:checked) #false
puts composet.checked #false
composet.check
puts composet.checked #true
puts composet.sub_tasks.all?(&:checked) #true
