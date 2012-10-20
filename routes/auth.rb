# encoding: utf-8

class Wintermute
  get "/login/?" do
    if logged_in?
      redirect "/"
    else
      erb :"auth/login"
    end
  end

  post "/login/?" do
    if user = User.authenticate(params["login"]["username"], params["login"]["password"])
      session[:user] = user.id
      session[:ip] = request.ip

      redirect_to_stored
    else
      redirect "/login"
    end
  end

  get "/logout/?" do
    if logged_in?
      session[:user] = nil
    end

    redirect "/"
  end

  helpers do
    def current_user
      User.get(session[:user])
    end

    def logged_in?
      (!!current_user && session[:ip] == request.ip)
    end

    def login_required
      return true if logged_in?

      session[:stored_path] = request.fullpath

      redirect "/login"

      pass
    end

    def redirect_to_stored
      if new_loc = session[:stored_path]
        session[:stored_path] = nil
        redirect new_loc
      else
        redirect "/"
      end
    end
  end
end

