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
        age: 24
        })

      @patient_2 = Patient.create!({
        name: 'Denny Duquette',
        age: 39
        })

      @patient_3 = Patient.create!({
        name: 'Rebecca Pope',
        age: 32
        })

      @patient_4 = Patient.create!({
        name: 'Zola Shepherd',
        age: 2
        })

      @doc_patient_1 = DoctorPatient.create!({
        doctor_id: @doc_1.id,
        patient_id: @patient_1.id
        })

      @doc_patient_2 = DoctorPatient.create!({
        doctor_id: @doc_1.id,
        patient_id: @patient_2.id
        })

      @doc_patient_3 = DoctorPatient.create!({
        doctor_id: @doc_1.id,
        patient_id: @patient_3.id
        })

      @doc_patient_4 = DoctorPatient.create!({
        doctor_id: @doc_2.id,
        patient_id: @patient_4.id
        })
    end

    it "I see that doc's info including name, specialty and university" do
      visit "/doctors/#{@doc_1.id}"

      expect(page).to have_content('Meredith Grey')
      expect(page).to have_content('Specialty: General Surgery')
      expect(page).to have_content('Education: Harvard University')
    end

    it "I see the name of the hospital they work at and names of all their patients" do
      visit "/doctors/#{@doc_1.id}"

      expect(page).to have_content('Works at Grey Sloan Memorial Hospital')
      expect(page).to have_content('Patients:')
      expect(page).to have_content('Katie Bryce')
      expect(page).to have_content('Denny Duquette')
      expect(page).to have_content('Rebecca Pope')
      expect(page).to_not have_content('Zola Shepherd')
    end

    it "Next to each patient's name I see a button to remove them from the doc's caseload" do
      visit "/doctors/#{@doc_1.id}"

      within "#patient-#{@patient_1.id}" do
        expect(page).to have_button("Remove")
      end

      within "#patient-#{@patient_2.id}" do
        expect(page).to have_button("Remove")
      end

      within "#patient-#{@patient_3.id}" do
        expect(page).to have_button("Remove")
      end
    end

    it "When I click the remove button next to a patient, I am brought back to doctor's
        show page and I no longer see that patient's name" do
        visit "/doctors/#{@doc_1.id}"

        within "#patient-#{@patient_2.id}" do
          click_button("Remove")
        end

        expect(current_path).to eq("/doctors/#{@doc_1.id}")
        expect(page).to have_content('Katie Bryce')
        expect(page).to have_content('Rebecca Pope')
        expect(page).to_not have_content('Denny Duquette')
    end
  end
end