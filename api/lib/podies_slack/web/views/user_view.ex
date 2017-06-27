defmodule PodiesSlack.Web.UserView do
  use PodiesSlack.Web, :view
  alias PodiesSlack.Web.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end


  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      username: user.username,
      email: user.email}
  end
end
