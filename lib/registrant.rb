require 'pry'

class Registrant
    attr_reader :name,
                :age,
                :permit,
                :license_data
            
    def initialize(name, age, license_data, permit = false)
        @name = name
        @age = age
        @license_data = license_data
        @permit = permit
    end

    def permit?
        @permit = permit
    end

    def earn_permit
        @permit = true
    end
end