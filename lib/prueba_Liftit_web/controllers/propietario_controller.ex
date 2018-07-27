defmodule Prueba_LiftitWeb.PropietarioController do
  use Prueba_LiftitWeb, :controller

  alias Prueba_Liftit.Propietario

  def index(conn, _params) do
    propietario = Propietario.list_propietarios()
    IO.inspect(propietario)
    render(conn, "index.html", propietario: propietario)
  end

  def new(conn, _params) do
    changeset = Propietario.change_propietario(%Propietario{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"propietario" => propietario_params}) do
    case Propietario.create_propietario(propietario_params) do
      {:ok, propietario} ->
        conn
        |> put_flash(:info, "Propietario agregado éxitosamente")
        |> redirect(to: propietario_path(conn, :show, propietario))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    propietario = Propietario.get_propietario!(id)
    render(conn, "show.html", propietario: propietario)
  end

  def edit(conn, %{"id" => id}) do
    propietario = Propietario.get_propietario!(id)
    changeset = Propietario.change_propietario(propietario)
    render(conn, "edit.html", propietario: propietario, changeset: changeset)
  end

  def update(conn, %{"id" => id, "propietario" => propietario_params}) do
    propietario = Propietario.get_propietario!(id)

    case Propietario.update_propietario(propietario, propietario_params) do
      {:ok, propietario} ->
        conn
        |> put_flash(:info, "Propietario actualizado éxitosamente")
        |> redirect(to: propietario_path(conn, :show, propietario))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", propietario: propietario, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    propietario = Propietario.get_propietario!(id)
    {:ok, _propietario} = Propietario.delete_propietario(propietario)

    conn
    |> put_flash(:info, "Propietario borrado éxitosamente.")
    |> redirect(to: propietario_path(conn, :index))
  end
end
