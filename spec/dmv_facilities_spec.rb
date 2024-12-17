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

    describe 'creates colorado facilities' do
        it 'can create colorado facilities' do
            co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
            @facility.create_facilities(co_dmv_office_locations)
            expect(@facility.facilities[0].name).to eq('DMV Tremont Branch')
            expect(@facility.facilities[0].address).to eq('2855 Tremont Place Denver CO ')
            expect(@facility.facilities[0].phone).to eq('(720) 865-4600')
        end
    end

    describe 'creates new york facilities' do
        it 'can create new york facilities' do
            ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
            @facility.create_facilities(ny_dmv_office_locations)
            expect(@facility.facilities[1].name).to eq('HUDSON')
            expect(@facility.facilities[1].address).to eq("560 WARREN STREET HUDSON NY 12534")
            expect(@facility.facilities[1].phone).to eq('5188283350')
        end
    end

    describe 'creates missouri facilities' do
        it 'can create missouri facilities' do
            mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
            @facility.create_facilities(mo_dmv_office_locations)
            expect(@facility.facilities[0].name).to eq('Harrisonville')
            expect(@facility.facilities[0].address).to eq("2009 Plaza Dr. Harrisonville MO 64701")
            expect(@facility.facilities[0].phone).to eq('(816) 884-4133')
        end
    end

end