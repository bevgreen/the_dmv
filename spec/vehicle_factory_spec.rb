require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'pry'
RSpec.describe VehicleFactory do

    before(:each) do
        @factory = VehicleFactory.new
    end

    describe '#initialize' do
        it 'checks Vehicle Factory class exists' do
            expect(@factory).to be_a(VehicleFactory)
        end
    end

    describe 'creates vehicles' do
        it 'can create vehicles' do
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            created_vehicles = @factory.create_vehicles(wa_ev_registrations)
    
            expect(@factory.created_vehicles[0].vin).to eq('WBY8P8C51K')
            expect(@factory.created_vehicles[0].year).to eq('2019')
            expect(@factory.created_vehicles[0].make).to eq('BMW')
            expect(@factory.created_vehicles[0].model).to eq('i3')
            expect(@factory.created_vehicles[0].engine).to eq(:ev)
        end
    end

end