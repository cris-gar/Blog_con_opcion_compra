class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @usuario = Usuario.from_omniauth(request.env["omniauth.auth"])

    if @usuario.persisted? #Validacion de creacion de Usuario
      sign_in_and_redirect @usuario
    else
      #session[:omniauth_errors] = @usuario.errors.full_messages.to_sentence unless @usuario.save

      #session[:omniauth_data] = data

      redirect_to new_usuario_registration_url # redireccion para la vista de registro para corregir errores
    end
  #  sign_in_and_redirect @usuario
  end
end