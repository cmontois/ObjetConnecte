class Pipe
  def self.start
    PIPE_PIN.on
  end

  def self.stop
    PIPE_PIN.off
  end
end
