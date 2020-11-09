require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the patient index page" do
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
        age: 24        })

      @patient_2 = Patient.create!({
        name: 'Denny Duquette',
        age: 39        })

      @patient_3 = Patient.create!({
        name: 'Rebecca Pope',
        age: 32        })

      @patient_4 = Patient.create!({
        name: 'Zola Shepherd',
        age: 2        })
    end

    it "I see the names of all patients listed from oldest to youngest" do
      visit "/patients"

      expect(page).to have_content("Patients Index")

      expect(page.text.index('Denny Duquette')).to be < page.text.index('Rebecca Pope')
      expect(page.text.index('Rebecca Pope')).to be < page.text.index('Katie Bryce')
      expect(page.text.index('Katie Bryce')).to be < page.text.index('Zola Shepherd')
    end
  end
end