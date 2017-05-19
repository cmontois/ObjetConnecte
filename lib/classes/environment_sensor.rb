class EnvironmentSensor
    def self.get_data
        value = `python #{Rails.root}/lib/scripts/environment_sensor.py`.gsub("\n", '')
        JSON.parse(value)
    end

    def self.get_temperature
        self.get_data['temperature']
    end

    def self.get_pressure
        self.get_data['pressure']
    end

    def self.get_humidity
        self.get_data['humidity']
    end
end