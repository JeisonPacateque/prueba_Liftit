defmodule Prueba_LiftitWeb.PageController do
  use Prueba_LiftitWeb, :controller
  alias Prueba_Liftit.Search

  def index(conn, params) do
    search_term = get_in(params, ["query"])

    Search.search(search_term)

    render conn, "index.html"
  end

end
