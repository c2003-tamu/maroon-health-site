# frozen_string_literal: true

class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          # for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do #|member|
      Member.create!(email: auth.info.email, password: Devise.friendly_token[0, 20], full_name: auth.info.name, avatar_url: auth.info.image)
      # member.email = auth.info.email
      # member.password = Devise.friendly_token[0, 20]
      # member.full_name = auth.info.name
      # member.avatar_url = auth.info.image
    end
  end
  
end
