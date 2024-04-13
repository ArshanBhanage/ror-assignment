class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:receptionist, :doctor]

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
    
end
