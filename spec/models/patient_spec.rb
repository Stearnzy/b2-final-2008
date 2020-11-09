require 'rails_helper'

describe Patient, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it { should belong_to :doctor }
  end

  describe "model test" do
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

    it "#oldest_to_youngest" do
      patients = Patient.all
require "pry"; binding.pry
      expected = ['Denny Duquette', 'Rebecca Pope', 'Katie Bryce', 'Zola Shepherd']
      expect(patients.oldest_to_youngest).to eq(expected)
    end
  end
end