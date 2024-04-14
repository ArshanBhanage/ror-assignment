class Doctor::DoctorsController < ApplicationController
    def dashboard
        # Get patients grouped by day as a hash where the keys are the dates
        @patients_per_day = Patient.group_by_day(:created_at, last: 7).count

        # # Define the specific date to exclude
        # date_to_exclude = Date.new(2024, 4, 13)

        # # Remove the entry for April 13, 2024, if it exists
        # @patients_per_day.delete(date_to_exclude)

        # @patients_per_day now has the counts excluding April 13, 2024

    end
end
