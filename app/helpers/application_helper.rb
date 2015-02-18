module ApplicationHelper

  def get_email_oauth #helper para autocompletar los datos por registro en omniauth
    if session[:omniauth_data]
      session[:omniauth_data][:email]
    else
      ""
    end
  end
end
