require 'pry'
class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)

    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      vehicle.registration_date
    end

    if vehicle[:year] < 1999
      @collect_fees += 25
    elsif vehicle[:engine] == ev
      @collect_fees += 200
    else 
      @collect_fees += 100
    end
  end
  
end
