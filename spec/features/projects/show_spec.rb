require 'rails_helper'


RSpec.describe Project, type: :feature do
  describe "As a visitor" do
    before :each do
      @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)

      @news_chic = @recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")

      @jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create!(contestant_id: @jay.id, project_id: @news_chic.id)
      ContestantProject.create!(contestant_id: @gretchen.id, project_id: @news_chic.id)
    end

    describe "When I visit a project's show page" do
      it "I see that project's name and material" do
        visit "/projects/#{@news_chic.id}"

        expect(page).to have_content("News Chic")
        expect(page).to have_content("Newspaper")
      end
      it "I also see the theme of the challenge that this project belongs to" do
        
      end
    end
  end
end