module ApplicationHelper

  def get_email_oauth #helper para autocompletar los datos por registro en omniauth
    if devise_error_messages!
      @usuario.email
    else

    end
  end
end
