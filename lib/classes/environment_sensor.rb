class EnvironmentSensor
  def self.get_temperature
    self.get_data['temperature']
  end

  def self.get_pressure
    self.get_data['pressure'].to_i
  end

  def self.get_air_humidity
    self.get_data['humidity'].to_i
  end

  def self.get_soil_humidity
    value = `python #{Rails.root}/lib/scripts/moisture_sensor.py 0`.gsub("\n", '').to_i
    return value if value == -1
    (value.to_f / 950.0 * 100.0).to_i
  end

  def self.get_data
    value = `python #{Rails.root}/lib/scripts/environment_sensor.py`.gsub("\n", '')
    JSON.parse(value)
  end

end
