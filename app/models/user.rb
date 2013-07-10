class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  # attr_accessible :title, :body
  has_many :question, dependent: :destroy
  has_many :answer, dependent: :destroy
  acts_as_voter

  self.per_page = 10
  
  def feed
    Question
  end
  
  def feea
    Answer
  end
  
  def feec
    Comment
  end
  
end
