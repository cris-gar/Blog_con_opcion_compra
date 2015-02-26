class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |usuario|
      usuario.provider = auth.provider
      usuario.uid = auth.uid
      usuario.email = auth.info.email
      usuario.password = Devise.friendly_token[0,20]
      usuario.nombre = auth.info.first_name
      usuario.apellido = auth.info.last_name
      usuario.username = auth.info.nickname
    end
  end
end
