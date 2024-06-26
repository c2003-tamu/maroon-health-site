# frozen_string_literal: true

class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable,
         # for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |member|
      member.email = auth.info.email
      member.password = Devise.friendly_token[0, 20]
      member.full_name = auth.info.name
      member.avatar_url = auth.info.image
    end
  end

  def admin?
    role == 'admin'
  end

  def volunteer?
    role == 'volunteer'
  end
end
