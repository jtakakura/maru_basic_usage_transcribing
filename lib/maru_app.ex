defmodule MaruApp.Router.Homepage do
  require Logger
  use Maru.Router

  get do
    Logger.info "called: get"
    {:ok, xconn} = Xandra.start_link(nodes: ["127.0.0.1:9042"])

    # query = "INSERT INTO kopt.users (id, name, email) VALUES (uuid(), 'Junji Takakura', 'j.takakura@gmail.com')"
    # {:ok, %Xandra.Void{}} = Xandra.execute(xconn, query, _params = [])

    # with {:ok, prepared} <- Xandra.prepare(xconn, "SELECT * FROM kopt.users WHERE email = ?"),
    #   {:ok, %Xandra.Page{} = page} <- Xandra.execute(xconn, prepared, [_email = "j.takakura@gmail.com"]),
    #   do: Logger.info Enum.to_list(page)
    user = xconn |> Xandra.execute!("SELECT * FROM kopt.users") |> Enum.fetch!(0)
    IO.inspect(user)

    json(conn, %{hell: :world})
  end
end

defmodule MaruApp.API do
  use Maru.Router

  plug Plug.Parsers,
    pass: ["*/*"],
    json_decoder: Poison,
    parsers: [:urlencoded, :json, :multipart]

  mount MaruApp.Router.Homepage

  rescue_from :all, as: e do
    conn
    |> put_status(500)
    |> text("Server Error: #{inspect e}")
  end
end
