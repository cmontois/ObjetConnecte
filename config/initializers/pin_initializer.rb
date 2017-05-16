begin
  PIPE_PIN = PiPiper::Pin.new(pin: 21, direction: :out)
rescue
  PIPE_PIN = nil
end
