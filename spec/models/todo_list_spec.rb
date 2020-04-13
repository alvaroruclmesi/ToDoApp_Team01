require 'rails_helper'

RSpec.describe TodoList, type: :model do
    usuario = User.new(first_name: "Manolo", last_name: "Martínez", username: "ManoloMar", email: "ManoloMart1ne966@gmail.com", password: "Cuarentena?", password_confirmation: "Cuarentena?") 
    subject { TodoList.new(title: "Una nueva lista", description: "El malvado Darth Ruby ataca de nuevo", user: usuario)}

    it 'The original TodoList is valid' do
        expect(subject).to be_valid
    end

    it 'The title cant be empty' do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it 'The description cant be empty' do
        subject.description = nil
        expect(subject).to_not be_valid
    end

end