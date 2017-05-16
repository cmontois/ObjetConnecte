class Pipe
  def self.start
    PIPE_PIN.on unless PIPE_PIN.nil?
  end

  def self.stop
    PIPE_PIN.off unless PIPE_PIN.nil?
  end
end
