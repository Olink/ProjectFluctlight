##
#RepeatingTask
#A simple placeholder until we can write a more cohesive repeating system to do our tick logic every x minutes.
#Will likely use a library or simple cron jobs to ensure that this is punctual, but for now this will be fine
class RepeatingTask

  def initialize(task, delay)
    @task = task
    @delay = delay
    @start = Time.now
    @running = true
    @thread = Thread.new{invoke()}
  end

  def invoke
    while @running
      Thread.new(){
        @task.call
      }
      sleep(@delay/1000.0)
    end
  end

  def end
    @running = false
    @thread.wakeup
  end
end