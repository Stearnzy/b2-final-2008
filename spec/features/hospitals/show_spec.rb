require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a hospital's show page" do
    before(:each) do
      @hospital = Hospital.create!({
        name: 'Grey Sloan Memorial Hospital'
        })
    end

    it "I see the hospital's name" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content('Grey Sloan Memorial Hospital')
    end
  end
end