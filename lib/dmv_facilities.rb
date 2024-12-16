class DMVFacilities
    attr_reader :created_facilities
    def initialize
        @created_facilities = []
    end
    
    def create_facilities(facility_data)
        @created_facilities = []
        facility_data.each do |facility|
            new_facility = Facility.new({
                :name => facility[:dmv_office],
                :address => facility[:address_li],
                :phone => facility[:phone]
            })
            @created_facilities << new_facility
            #binding.pry
        end
    end
end