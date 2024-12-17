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
    end

  end
  
  def collect_fee(vehicle)
    
    if vehicle.year < 1999
      @collected_fees += 25
    elsif vehicle.engine == :ev
      @collected_fees += 200
    else 
      @collected_fees += 100
    end

  end

  def administer_written_test(registrant)

    if @services.include?('Written Test') && registrant.permit? == true && registrant.age >= 16
      registrant.change_license_data(:written)
      true
    else 
      return false
    end

  end

  def administer_road_test(registrant)

    if @services.include?('Road Test') && registrant.age >= 16 && registrant.license_data[:written] == true
      registrant.change_license_data(:license)
      true
    else 
      return false
    end

  end

  def renew_drviers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:written] == true && registrant.license_data[:license] == true
      registrant.change_license_data(:renewed)
      true
    else 
      return false
    end
  end

end
