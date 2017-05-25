class EnvironmentSensor
  def self.get_temperature
    self.get_data['temperature']
  end

  def self.get_pressure
    self.get_data['pressure']
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

  def self.get_weather
    pressure = self.get_pressure
    # Report created 1 hour ago
    old_report = Report.where('created_at > ?', (Time.now - 1.hour)).order(:created_at).first
    old_pressure = old_report.pressure

    if old_pressure != nil
      # Get the pressure from the oldReport in order to compare with the current one
      diff_pressure = pressure - old_pressure
      return :bad if diff_pressure < -1
      return :bad_incoming if diff_pressure < -0.25
      return :good if diff_pressure > 1
      return :good_incoming if diff_pressure > 0.25
      return :same
    end
  end
end
