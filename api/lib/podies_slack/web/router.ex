defmodule PodiesSlack.Web.Router do
  use PodiesSlack.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", PodiesSlack.Web do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
