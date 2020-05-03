class TodoList < ApplicationRecord
    belongs_to :user
    has_many :todo_items, 
    dependent: :delete_all
    validates :title, presence: true
    validates :description, presence: true
end
