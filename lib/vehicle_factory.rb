class VehicleFactory 
    attr_reader :created_vehicles

    def initialize
        @created_vehicles = []
    end

    def create_vehicles(vehicle_data)
        @created_vehicles = []
        vehicle_data.each do |vehicle|
            new_vehicle = Vehicle.new ({
                :vin => vehicle[:vin_1_10],
                :year => vehicle[:model_year],
                :make => vehicle[:make],
                :model => vehicle[:model],
                :engine => :ev
            })
            @created_vehicles << new_vehicle
        end
    end

end