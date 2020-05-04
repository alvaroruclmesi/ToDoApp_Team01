class User < ApplicationRecord
  has_many :todo_lists
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  
  

  def password_complexity
    if !password.blank?
      if !password.match(/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[#?!@$%^&-])/) 
        errors.add :password, "Password not strong: must include at least 8 chars, with at least 1 uppercase, 
                                1 lowercase and 1 special char"
      end
    end 
  end

  def destroy_with_password(current_password)
    puts "First gateway==" + current_password
    result = if valid_password?(current_password)
      puts "La comparacion OK"
      destroy
      true
    else
      puts "Comparacion no OK"
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end
    
    result
  end

  def valid_password?(password)
    #puts "Encrypted-user2==" + encrypted_password
    #puts "Password-typed==" + password
    #puts "Password-enc==" + BCrypt::Password.create(password)
    #puts BCrypt::Password.new(encrypted_password) == password
    #Devise::Encryptor.compare(self.class, encrypted_password, password)
    BCrypt::Password.new(encrypted_password) == password
  end
end
