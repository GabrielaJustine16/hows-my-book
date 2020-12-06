class User < ApplicationRecord
  #has_many :books
  has_many :reviews
  has_many :books, through: :reviews

  validates :email, confirmation: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable

         def self.from_omniauth(auth)  
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
          end
        end
  
end
