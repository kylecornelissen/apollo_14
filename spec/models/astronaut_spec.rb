require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:missions).through(:astronaut_missions)}
  end

  describe 'Class Methods' do
    it '.average_age' do
      astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create!(name: "Buzz Lightyear", age: 24, job: "Infinity")
      astronaut_3 = Astronaut.create!(name: "Tim Allen", age: 45, job: "Toolman")
      astronauts = Astronaut.all

      expect(astronauts.average_age.round(1)).to eq(35.3)
    end
  end
end
