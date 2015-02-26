class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @usuario = Usuario.from_omniauth(request.env["omniauth.auth"])

    if @usuario.persisted? #Validacion de creacion de Usuario
      sign_in_and_redirect @usuario
    else
      redirect_to new_usuario_registration_url # redireccion para la vista de registro para corregir errores
    end
  end
end