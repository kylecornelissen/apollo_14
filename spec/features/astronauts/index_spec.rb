require 'rails_helper'

RSpec.describe "astronaut index page", type: :feature do
  before :each do
    @astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
    @astronaut_2 = Astronaut.create!(name: "Buzz Lightyear", age: 24, job: "Infinity")
    @astronaut_3 = Astronaut.create!(name: "Tim Allen", age: 45, job: "Toolman")

    @mission_1 = Mission.create!(title: "Moon Walker", time_in_space: 35)
    @mission_2 = Mission.create!(title: "Mars and Back", time_in_space: 235)
    @mission_3 = Mission.create!(title: "Apollo 13", time_in_space: 45)

    @astronauts = Astronaut.all
  end

  it "shows all astronauts" do
    visit astronauts_path

    expect(page).to have_content(@astronaut_1.name)
    expect(page).to have_content(@astronaut_1.age)
    expect(page).to have_content(@astronaut_1.job)
    expect(page).to have_content(@astronaut_2.name)
    expect(page).to have_content(@astronaut_2.age)
    expect(page).to have_content(@astronaut_2.job)
    expect(page).to have_content(@astronaut_3.name)
    expect(page).to have_content(@astronaut_3.age)
    expect(page).to have_content(@astronaut_3.job)
  end

  it "shows average age of all astronauts" do
    visit astronauts_path

    expect(page).to have_content(@astronauts.average_age)
  end

#   User Story 3 of 4
#
# As a visitor,
# When I visit '/astronauts'
# I see a list of the space missions' in alphabetical order for each astronaut.
#
# (e.g "Apollo 13"
#      "Capricorn 4"
#      "Gemini 7")
  it "shows space missions in alphabetical order" do
    visit astronauts_path

    expect(page.all('li')[0]).to have_content(@mission_2.title)
    expect(page.all('li')[1]).to have_content(@mission_3.title)
    expect(page.all('li')[2]).to have_content(@mission_1.title)
  end
end
