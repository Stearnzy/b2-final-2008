require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a doctor's show page" do
    before(:each) do
      @hospital = Hospital.create!({
        name: 'Grey Sloan Memorial Hospital'
        })

      @doc_1 = Doctor.create!({
        name: 'Meredith Grey',
        specialty: 'General Surgery',
        university: 'Harvard University',
        hospital_id: @hospital.id
        })

      @doc_2 = Doctor.create!({
        name: 'Alex Karev',
        specialty: 'Pediatric Surgery',
        university: 'Johns Hopkins University',
        hospital_id: @hospital.id
        })

      @patient_1 = Patient.create!({
        name: 'Katie Bryce',
        age: 24,
        doctor_id: @doc_1.id
        })

      @patient_2 = Patient.create!({
        name: 'Denny Duquette',
        age: 39,
        doctor_id: @doc_1.id
        })

      @patient_3 = Patient.create!({
        name: 'Rebecca Pope',
        age: 32,
        doctor_id: @doc_1.id
        })

      @patient_4 = Patient.create!({
        name: 'Zola Shepherd',
        age: 2,
        doctor_id: @doc_2.id
        })
    end

    it "I see that doc's info including name, specialty and university" do
      visit "/doctors/#{@doc_1.id}"

      expect(page).to have_content('Meredith Grey')
      expect(page).to have_content('Specialty: General Surgery')
      expect(page).to have_content('Education: Harvard University')
    end
  end
end