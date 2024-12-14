require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new("Bruce", 18, {:written =>false, :license => false, :renewed => false}, true)
        @registrant_2 = Registrant.new("Penny", 15, {:written =>false, :license => false, :renewed => false})
    end

    describe 'initialize'do 
        it 'can initialize' do
        expect(@registrant_1). to be_an_instance_of(Registrant)
        expect(@registrant_2). to be_an_instance_of(Registrant)
        end
    end

    describe 'registrant data' do
        it 'can store names'do
            expect(@registrant_1.name). to eq("Bruce")
            expect(@registrant_2.name). to eq("Penny")
        end

        it 'can store ages' do
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_2.age).to eq(15)
        end

        it 'can tell if they have a permit'do
            expect(@registrant_1.permit?). to eq(true)
            expect(@registrant_2.permit?). to eq(false)
        end

        it 'can pull license data'do
            expect(@registrant_1.license_data).to eq({:written =>false, :license => false, :renewed => false})
            expect(@registrant_2.license_data).to eq({:written =>false, :license => false, :renewed => false})
        end

        it 'can let registrants earn permit'do
            @registrant_2.earn_permit
            expect(@registrant_2.permit?).to eq(true)
        end
    end


end