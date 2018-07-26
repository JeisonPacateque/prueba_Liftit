defmodule Prueba_LiftitWeb.VehiculoControllerTest do
  use Prueba_LiftitWeb.ConnCase

  alias Prueba_Liftit.Web

  @create_attrs %{marca: "some marca", placa: "some placa", propietario: "some propietario", tipo: "some tipo"}
  @update_attrs %{marca: "some updated marca", placa: "some updated placa", propietario: "some updated propietario", tipo: "some updated tipo"}
  @invalid_attrs %{marca: nil, placa: nil, propietario: nil, tipo: nil}

  def fixture(:vehiculo) do
    {:ok, vehiculo} = Web.create_vehiculo(@create_attrs)
    vehiculo
  end

  describe "index" do
    test "lists all vehiculo", %{conn: conn} do
      conn = get conn, vehiculo_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Vehiculo"
    end
  end

  describe "new vehiculo" do
    test "renders form", %{conn: conn} do
      conn = get conn, vehiculo_path(conn, :new)
      assert html_response(conn, 200) =~ "New Vehiculo"
    end
  end

  describe "create vehiculo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, vehiculo_path(conn, :create), vehiculo: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == vehiculo_path(conn, :show, id)

      conn = get conn, vehiculo_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Vehiculo"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, vehiculo_path(conn, :create), vehiculo: @invalid_attrs
      assert html_response(conn, 200) =~ "New Vehiculo"
    end
  end

  describe "edit vehiculo" do
    setup [:create_vehiculo]

    test "renders form for editing chosen vehiculo", %{conn: conn, vehiculo: vehiculo} do
      conn = get conn, vehiculo_path(conn, :edit, vehiculo)
      assert html_response(conn, 200) =~ "Edit Vehiculo"
    end
  end

  describe "update vehiculo" do
    setup [:create_vehiculo]

    test "redirects when data is valid", %{conn: conn, vehiculo: vehiculo} do
      conn = put conn, vehiculo_path(conn, :update, vehiculo), vehiculo: @update_attrs
      assert redirected_to(conn) == vehiculo_path(conn, :show, vehiculo)

      conn = get conn, vehiculo_path(conn, :show, vehiculo)
      assert html_response(conn, 200) =~ "some updated marca"
    end

    test "renders errors when data is invalid", %{conn: conn, vehiculo: vehiculo} do
      conn = put conn, vehiculo_path(conn, :update, vehiculo), vehiculo: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Vehiculo"
    end
  end

  describe "delete vehiculo" do
    setup [:create_vehiculo]

    test "deletes chosen vehiculo", %{conn: conn, vehiculo: vehiculo} do
      conn = delete conn, vehiculo_path(conn, :delete, vehiculo)
      assert redirected_to(conn) == vehiculo_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, vehiculo_path(conn, :show, vehiculo)
      end
    end
  end

  defp create_vehiculo(_) do
    vehiculo = fixture(:vehiculo)
    {:ok, vehiculo: vehiculo}
  end
end
