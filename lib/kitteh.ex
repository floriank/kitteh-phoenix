defmodule Kitteh do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(Kitteh.Endpoint, []),
      # Start the Ecto repository
      worker(Kitteh.Repo, []),
      # Here you could define other workers and supervisors as children
      # worker(Kitteh.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kitteh.Supervisor]
    res = Supervisor.start_link(children, opts)
    if System.get_env("MIX_ENV") == "prod" do
      migrate
    end

    res
  end

  defp migrate do
    migrations = Path.join(["#{:code.priv_dir(:kitteh)}", "repo", "migrations"])
    IO.puts "######### running migrations..."
    Ecto.Migrator.run(Kitteh.Repo, migrations, :up, all: true)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Kitteh.Endpoint.config_change(changed, removed)
    :ok
  end
end
