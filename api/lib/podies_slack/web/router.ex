defmodule PodiesSlack.Web.Router do
  use PodiesSlack.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PodiesSlack.Web do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
