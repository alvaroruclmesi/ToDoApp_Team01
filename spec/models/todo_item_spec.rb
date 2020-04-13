require 'rails_helper'

RSpec.describe TodoItem, type: :model do
    usuario = User.new(first_name: "Manolo", last_name: "Martínez", username: "ManoloMar", email: "ManoloMart1ne966@gmail.com", password: "Cuarentena?", password_confirmation: "Cuarentena?") 
    lista= TodoList.new(title: "Una nueva lista", description: "El malvado Darth Ruby ataca de nuevo", user: usuario)
    subject { TodoItem.new(content: "Un nuevo item", priority: "High", deadline: "24/02/2021", todo_list: lista) }

    it 'The original item is valid' do
        expect(subject).to be_valid
    end

    it 'The content cant be empty' do
        subject.content = nil
        expect(subject).to_not be_valid
    end
    it 'The priority cant be empty' do
        subject.content = nil
        expect(subject).to_not be_valid
    end
    it 'The date cant be empty' do
        subject.content = nil
        expect(subject).to_not be_valid
    end

    it 'The date must be like dd/mm/yy' do
        subject.deadline= "Today"
        expect(subject).to_not be_valid
    end

    
end