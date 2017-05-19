class EnvironmentSensor
    def self.get_data
        value = `python #{Rails.root}/lib/scripts/BME280_I2C.py 0`.gsub("\n", '').to_i
        return value if value == -1
    end
end