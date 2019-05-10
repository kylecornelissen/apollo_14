require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:astronauts).through(:astronaut_missions)}
  end

  describe 'Class Methods' do
    it '.order_alphabetical' do
      astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create!(name: "Buzz Lightyear", age: 24, job: "Infinity")
      astronaut_3 = Astronaut.create!(name: "Tim Allen", age: 45, job: "Toolman")
      astronauts = Astronaut.all
      mission_1 = Mission.create!(title: "Moon Walker", time_in_space: 35)
      mission_2 = Mission.create!(title: "Mars and Back", time_in_space: 235)
      mission_3 = Mission.create!(title: "Apollo 13", time_in_space: 45)
      missions = Mission.all
      
      expect(missions.order_alphabetical).to eq([mission_3,mission_2,mission_1])
    end
  end
end
