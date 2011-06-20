class User < ActiveRecord::Base
  belongs_to :filiale
  has_many :orders
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def user?
    role == "user"
  end
  
  def logistique?
    role == "logistique"
  end
  
  def achat?
    role == "achat"
  end
  
  def siege?
    role == "siege"
  end
  
  def marketing?
    role == "marketing"
  end
  
  
end
