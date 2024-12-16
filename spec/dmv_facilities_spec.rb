require 'spec_helper'

RSpec.describe DMVFacilities do

    before(:each) do
        @facility = DMVFacilities.new
    end

    describe '#initialize' do
        it 'checks DMVFacilities class exists' do
            expect(@facility).to be_a(DMVFacilities)
        end
    end 

    describe 'creates facilities' do
        it 'can create facilities' do
            co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
            created_facilities = @facility.create_facilities(co_dmv_office_locations)
            # binding.pry
            expect(@facility.created_facilities[0].name).to eq('DMV Tremont Branch')
            expect(@facility.created_facilities[0].address).to eq('2855 Tremont Place')
            expect(@facility.created_facilities[0].phone).to eq('(720) 865-4600')
        end
    end

end