defmodule Prueba_LiftitWeb.PropietarioControllerTest do
  use Prueba_LiftitWeb.ConnCase

  alias Prueba_Liftit.Web

  @create_attrs %{cedula: "some cedula", nombre: "some nombre", vehiculos: "some vehiculos"}
  @update_attrs %{cedula: "some updated cedula", nombre: "some updated nombre", vehiculos: "some updated vehiculos"}
  @invalid_attrs %{cedula: nil, nombre: nil, vehiculos: nil}

  def fixture(:propietario) do
    {:ok, propietario} = Web.create_propietario(@create_attrs)
    propietario
  end

  describe "index" do
    test "lists all propietario", %{conn: conn} do
      conn = get conn, propietario_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Propietario"
    end
  end

  describe "new propietario" do
    test "renders form", %{conn: conn} do
      conn = get conn, propietario_path(conn, :new)
      assert html_response(conn, 200) =~ "New Propietario"
    end
  end

  describe "create propietario" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, propietario_path(conn, :create), propietario: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == propietario_path(conn, :show, id)

      conn = get conn, propietario_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Propietario"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, propietario_path(conn, :create), propietario: @invalid_attrs
      assert html_response(conn, 200) =~ "New Propietario"
    end
  end

  describe "edit propietario" do
    setup [:create_propietario]

    test "renders form for editing chosen propietario", %{conn: conn, propietario: propietario} do
      conn = get conn, propietario_path(conn, :edit, propietario)
      assert html_response(conn, 200) =~ "Edit Propietario"
    end
  end

  describe "update propietario" do
    setup [:create_propietario]

    test "redirects when data is valid", %{conn: conn, propietario: propietario} do
      conn = put conn, propietario_path(conn, :update, propietario), propietario: @update_attrs
      assert redirected_to(conn) == propietario_path(conn, :show, propietario)

      conn = get conn, propietario_path(conn, :show, propietario)
      assert html_response(conn, 200) =~ "some updated cedula"
    end

    test "renders errors when data is invalid", %{conn: conn, propietario: propietario} do
      conn = put conn, propietario_path(conn, :update, propietario), propietario: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Propietario"
    end
  end

  describe "delete propietario" do
    setup [:create_propietario]

    test "deletes chosen propietario", %{conn: conn, propietario: propietario} do
      conn = delete conn, propietario_path(conn, :delete, propietario)
      assert redirected_to(conn) == propietario_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, propietario_path(conn, :show, propietario)
      end
    end
  end

  defp create_propietario(_) do
    propietario = fixture(:propietario)
    {:ok, propietario: propietario}
  end
end
