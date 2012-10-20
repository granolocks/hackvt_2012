class Wintermute
  error do
    # TODO
    "Internal Server Error"
  end

  not_found do
    # TODO
    "Page Missing"
  end

  get "/?" do

   # TODO
   # login_required

    erb :index
  end
end

