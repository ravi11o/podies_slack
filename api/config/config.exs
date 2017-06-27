# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :podies_slack,
  ecto_repos: [PodiesSlack.Repo]

# Configures the endpoint
config :podies_slack, PodiesSlack.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "G6ZDdXfjhfPKM2URKIxGP0pyVJ0u0lKGgG37CT/b+vy+xv9RsaEbqSC46Jsag0Qw",
  render_errors: [view: PodiesSlack.Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: PodiesSlack.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
