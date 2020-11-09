require 'rails_helper'

describe Hospital, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :doctors }
  end

  describe "model methods" do
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
        hospital_id: @hospital.id
        })

      @doc_5 = Doctor.create!({
        name: 'Dwayne Johnson',
        specialty: 'Chiropractor',
        university: 'Stanford University',
        hospital_id: @hospital_2.id
        })
    end

    it "#doc_count" do
      expect(@hospital.doc_count).to eq(4)
    end
  end
end