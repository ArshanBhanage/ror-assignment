class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:receptionist, :doctor]

  has_many :appointments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  def name
    return self.first_name + " " + self.last_name
  end

  def doctor?
    role == 'doctor'
  end

  def receptionist?
    role == 'receptionist'
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "first_name", "id", "last_name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["appointments"]
  end  
    
end
