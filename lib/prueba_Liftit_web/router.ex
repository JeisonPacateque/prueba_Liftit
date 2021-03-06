defmodule Prueba_LiftitWeb.Router do
  use Prueba_LiftitWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Prueba_LiftitWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index


    resources "/propietario", PropietarioController

    resources "/vehiculo", VehiculoController
    post "/vehiculo/new/:p_id", VehiculoController, :new, as: :nuevo_vehiculo
  end

  # Other scopes may use custom stacks.
  # scope "/api", Prueba_LiftitWeb do
  #   pipe_through :api
  # end
end
