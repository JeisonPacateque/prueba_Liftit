defmodule Prueba_LiftitWeb.VehiculoController do
  use Prueba_LiftitWeb, :controller

  alias Prueba_Liftit
  alias Prueba_Liftit.Vehiculo

  def index(conn, _params) do
    vehiculo = Vehiculo.list_vehiculo()
    render(conn, "index.html", vehiculo: vehiculo)
  end

  def new(conn, _params) do
    changeset = Vehiculo.change_vehiculo(%Vehiculo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vehiculo" => vehiculo_params}) do
    case Vehiculo.create_vehiculo(vehiculo_params) do
      {:ok, vehiculo} ->
        conn
        |> put_flash(:info, "Vehiculo created successfully.")
        |> redirect(to: vehiculo_path(conn, :show, vehiculo))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vehiculo = Vehiculo.get_vehiculo!(id)
    render(conn, "show.html", vehiculo: vehiculo)
  end

  def edit(conn, %{"id" => id}) do
    vehiculo = Vehiculo.get_vehiculo!(id)
    changeset = Vehiculo.change_vehiculo(vehiculo)
    render(conn, "edit.html", vehiculo: vehiculo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vehiculo" => vehiculo_params}) do
    vehiculo = Vehiculo.get_vehiculo!(id)

    case Vehiculo.update_vehiculo(vehiculo, vehiculo_params) do
      {:ok, vehiculo} ->
        conn
        |> put_flash(:info, "Vehiculo updated successfully.")
        |> redirect(to: vehiculo_path(conn, :show, vehiculo))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", vehiculo: vehiculo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehiculo = Vehiculo.get_vehiculo!(id)
    {:ok, _vehiculo} = Vehiculo.delete_vehiculo(vehiculo)

    conn
    |> put_flash(:info, "Vehiculo deleted successfully.")
    |> redirect(to: vehiculo_path(conn, :index))
  end
end
