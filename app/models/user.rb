class User < ApplicationRecord
  has_many :todo_lists
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity

  def password_complexity
    if !password.blank?
      if !password.match(/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[#?!@$%^&-])/) 
        errors.add :password, "Password not strong: must include at least 8 chars, with at least 1 uppercase, 
                                1 lowercase and 1 special char"
      end
    end 
  end
end
