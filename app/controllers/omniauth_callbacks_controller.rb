class OmniauthCallbacksController < ApplicationController

  def facebook
    auth = request.env["omniauth.auth"]
    #raise auth.to_yaml
    #Hash con los datos que trae devise de facebook
    data = {
        nombre: auth.info.first_name,
        apellido: auth.info.last_name,
        username: auth.info.nickname,
        email: auth.info.email,
        provider: auth.provider,
        uid: auth.uid
    }

    @usuario = Usuario.find_or_create_by_omniauth(auth)

    if @usuario.persisted? #Validacion de creacion de Usuario
      sing_in_add_redirect @usuario, event: :authentication
    else
      session[:omniauth_errors] = @usuario.errors.full_messages.to_sentence unless @usuario.save

      session[:omniauth_data] = data

      redirect_to new_usuario_registration_url # redireccion para la vista de registro para corregir errores
    end
  end
end