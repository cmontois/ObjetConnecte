class EnvironmentSensor
    def self.get_data
        value = `python #{Rails.root}/lib/scripts/environment_sensor.py`.gsub("\n", '')
        JSON.parse(value)
    end
end