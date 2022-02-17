import Config

config :cart, Cart.Repo,
  database: "cart_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :cart, ecto_repos: [Cart.Repo]
