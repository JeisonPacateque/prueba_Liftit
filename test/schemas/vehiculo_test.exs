defmodule Prueba_Liftit.VehiculoTest do
  use Prueba_Liftit.DataCase, async: true
  alias Prueba_Liftit.Vehiculo

  describe "Vehiculo.create_vehiculo/1" do
    @invalid_attrs %{}
    @valid_attrs %{
      placa: "FOO-132",
      marca: "canyonero",
      tipo: "4x4"
    }

    test "changeset con atributos invalidos" do
      {resp, changeset} = Vehiculo.create_vehiculo(@invalid_attrs)

      refute changeset.valid?
    end

    test "vehiculo con placa repetida" do
      Vehiculo.create_vehiculo(@valid_attrs)

      {:error, vehiculo} = Vehiculo.create_vehiculo(@valid_attrs)

      assert %{placa: ["has already been taken"]} = errors_on(vehiculo)
    end

    test "todos los atributos se guardan correctamente" do
      {:ok, vehiculo} = Vehiculo.create_vehiculo(@valid_attrs)
      vehiculo = Repo.get!(Vehiculo,vehiculo.id)

      assert vehiculo.placa == @valid_attrs[:placa]
      assert vehiculo.marca == @valid_attrs[:marca]
      assert vehiculo.tipo == @valid_attrs[:tipo]
    end
  end
end
