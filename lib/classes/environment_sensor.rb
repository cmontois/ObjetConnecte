class EnvironmentSensor
    def self.get_data
        value = `python #{Rails.root}/lib/scripts/environment_sensor.py`
        puts value
        return value if value == -1
    end
end