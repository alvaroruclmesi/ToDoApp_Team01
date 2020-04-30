class User < ApplicationRecord
  has_many :todo_lists
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  validate :password_correct
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  #validates :current_password, presence: true, on: :destroy

  
  

  def password_complexity
    if !password.blank?
      if !password.match(/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[#?!@$%^&-])/) 
        errors.add :password, "Password not strong: must include at least 8 chars, with at least 1 uppercase, 
                                1 lowercase and 1 special char"
      end
    end 
  end

  def password_correct
    if current_password
      if !current_password.match(password)
        errors.add :password, "Password does not match"
      end
    end
  end

  def destroy_with_password(current_password)
    result = if valid_password?(current_password)
      destroy
    else
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    result
  end

  def valid_password?(password)
    Devise::Encryptor.compare(self.class, encrypted_password, password)
  end

end
