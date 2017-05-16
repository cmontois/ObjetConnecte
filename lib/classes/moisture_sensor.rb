class MoistureSensor
  def self.get_value
    value = `python #{Rails.root}/lib/scripts/moisture_sensor.py 0`.gsub("\n", '').to_i
    return value if value == -1
    (value.to_f / 950.0 * 100.0).to_i
  end
end
