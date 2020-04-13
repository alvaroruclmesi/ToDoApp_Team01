require 'rails_helper'

RSpec.describe User, type: :model do
    
    subject { User.new(first_name: "Manolo", last_name: "Martínez", username: "ManoloMar", email: "ManoloMart1ne966@gmail.com", password: "Cuarentena?", password_confirmation: "Cuarentena?") }

    it 'The original user is valid' do
        expect(subject).to be_valid
      end

    it 'The name cant be empty' do
        subject.first_name = nil
        expect(subject).to_not be_valid
    end

    it 'The last name cant be empty' do
        subject.last_name = nil
        expect(subject).to_not be_valid
    end
    it 'The username cant be empty' do
        subject.username = nil
        expect(subject).to_not be_valid
    end

    it 'The email cant be empty' do
        subject.email = nil
        expect(subject).to_not be_valid
    end
    
    it 'The email manolosinarroba is not valid' do
        subject.email = "manolosinarroba"
       
        expect(subject).to_not be_valid
    end

    it 'The password cuarentena is not valid' do
        subject.password = "cuarentena"
        expect(subject).to_not be_valid
    end

    it "The passwords don't match" do
        subject.password = "Cuarentena?"
        subject.password_confirmation ="Cuarentena#"
        expect(subject).to_not be_valid
    end
    
   

end