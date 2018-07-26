defmodule Prueba_LiftitWeb.PageController do
  use Prueba_LiftitWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
