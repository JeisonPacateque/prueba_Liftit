defmodule Prueba_LiftitWeb.PropietarioController do
  use Prueba_LiftitWeb, :controller

  alias Prueba_Liftit
  alias Prueba_Liftit.Propietario

  def index(conn, _params) do
    propietario = Web.list_propietario()
    render(conn, "index.html", propietario: propietario)
  end

  def new(conn, _params) do
    changeset = Web.change_propietario(%Propietario{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"propietario" => propietario_params}) do
    case Web.create_propietario(propietario_params) do
      {:ok, propietario} ->
        conn
        |> put_flash(:info, "Propietario created successfully.")
        |> redirect(to: propietario_path(conn, :show, propietario))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    propietario = Web.get_propietario!(id)
    render(conn, "show.html", propietario: propietario)
  end

  def edit(conn, %{"id" => id}) do
    propietario = Web.get_propietario!(id)
    changeset = Web.change_propietario(propietario)
    render(conn, "edit.html", propietario: propietario, changeset: changeset)
  end

  def update(conn, %{"id" => id, "propietario" => propietario_params}) do
    propietario = Web.get_propietario!(id)

    case Web.update_propietario(propietario, propietario_params) do
      {:ok, propietario} ->
        conn
        |> put_flash(:info, "Propietario updated successfully.")
        |> redirect(to: propietario_path(conn, :show, propietario))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", propietario: propietario, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    propietario = Web.get_propietario!(id)
    {:ok, _propietario} = Web.delete_propietario(propietario)

    conn
    |> put_flash(:info, "Propietario deleted successfully.")
    |> redirect(to: propietario_path(conn, :index))
  end
end
