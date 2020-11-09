require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a hospital's show page" do
    before(:each) do
      @hospital = Hospital.create!({
        name: 'Grey Sloan Memorial Hospital'
        })

      @hospital_2 = Hospital.create!({
        name: 'Seaside Health & Wellness Center'
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

      @doc_3 = Doctor.create!({
        name: 'Miranda Bailey',
        specialty: 'General Surgery',
        university: 'Stanford University',
        hospital_id: @hospital.id
        })

      @doc_4 = Doctor.create!({
        name: 'Derek McDreamy Shepherd',
        specialty: 'Attending Surgeon',
        university: 'University of Pennsylvania',
        hospital_id: @hospital_2.id
        })

      @doc_5 = Doctor.create!({
        name: 'Dwayne Johnson',
        specialty: 'Chiropractor',
        university: 'Stanford University',
        hospital_id: @hospital.id
        })
    end

    it "I see the hospital's name" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content('Grey Sloan Memorial Hospital')
    end

    it "I see the number of doctors that work here" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content('Number of doctors: 4')
    end

    it "I see a unique list of universities this hospital's docs attended" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content('Alma maters:')
      expect(page).to have_content('Harvard University')
      expect(page).to have_content('Johns Hopkins University')
      expect(page).to have_content('Stanford University')
      expect(page).to_not have_content('University of Pennsylvania')
    end
  end
end