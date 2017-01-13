class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :restaurants
  has_many :reviews
  has_many :endorsments
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email || "#{auth.uid}@facebook.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def has_reviewed?(restaurant)
    reviewed_restaurants.include? restaurant
  end
end
