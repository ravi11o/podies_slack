defmodule PodiesSlack.Web.UserController do
  use PodiesSlack.Web, :controller

  alias PodiesSlack.Account
  alias PodiesSlack.Account.User

  action_fallback PodiesSlack.Web.FallbackController

  def index(conn, _params) do
    users = Account.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Account.create_user(user_params) do
      new_conn = Guardian.Plug.api_sign_in(conn, user, :access)
      jwt = Guardian.Plug.current_token(new_conn)

      new_conn
      |> put_status(:created)
      |> render(PodiesSlack.SessionView, "show.json", user: user, jwt: jwt)
    end
  end



  def delete(conn, %{"id" => id}) do
    user = Account.get_user!(id)
    with {:ok, %User{}} <- Account.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
