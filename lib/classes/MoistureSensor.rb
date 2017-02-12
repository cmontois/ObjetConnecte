class MoistureSensor
  def get_value
    exec("python #{Rails.root}/lib/scripts/moisture_sensor.py 0")
  end
end