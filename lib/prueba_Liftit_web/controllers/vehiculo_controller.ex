defmodule Prueba_LiftitWeb.VehiculoController do
  use Prueba_LiftitWeb, :controller

  alias Prueba_Liftit.Vehiculo

  def index(conn, _params) do
    vehiculo = Vehiculo.list_vehiculos()
    render(conn, "index.html", vehiculo: vehiculo)
  end

  def new(conn, params) do
    propietario_id = params["p_id"]
    changeset = Vehiculo.change_vehiculo(%Vehiculo{propietario_id:  propietario_id}, propietario_id)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vehiculo" => vehiculo_params}) do
    vehiculo_params = Map.merge(vehiculo_params, %{"propietario_id" => vehiculo_params["propietario_id"]} )
    case Vehiculo.create_vehiculo(vehiculo_params) do
      {:ok, vehiculo} ->
        conn
        |> put_flash(:info, "Vehiculo creado éxitosamente.")
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

        IO.inspect vehiculo_params
    case Vehiculo.update_vehiculo(vehiculo, vehiculo_params) do
      {:ok, vehiculo} ->
        conn
        |> put_flash(:info, "Vehiculo actualizado éxitosamente.")
        |> redirect(to: vehiculo_path(conn, :show, vehiculo))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", vehiculo: vehiculo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehiculo = Vehiculo.get_vehiculo!(id)
    {:ok, _vehiculo} = Vehiculo.delete_vehiculo(vehiculo)

    conn
    |> put_flash(:info, "Vehiculo borrado éxitosamente.")
    |> redirect(to: vehiculo_path(conn, :index))
  end
end
