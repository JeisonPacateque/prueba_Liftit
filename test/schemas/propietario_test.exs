defmodule Prueba_Liftit.PropietarioTest do
  use Prueba_Liftit.DataCase, async: true
  alias Prueba_Liftit.Repo
  alias Prueba_Liftit.Propietario

  describe "Propietario.create_propietario/1" do
    @invalid_attrs %{}
    @valid_attrs %{
      nombre: "Jeison Pacateque",
      cedula: "66666666"
    }

    test "con atributos invalidos" do
      {resp, changeset} = Propietario.create_propietario(@invalid_attrs)

      refute changeset.valid?
    end

    test "Propietario con cedula repetida" do
      Propietario.create_propietario(@valid_attrs)

      {:error, propietario} = Propietario.create_propietario(@valid_attrs)

      assert %{cedula: ["has already been taken"]} = errors_on(propietario)
    end

    test "todos los atributos se guardan correctamente" do
      {:ok, propietario} = Propietario.create_propietario(@valid_attrs)
      propietario = Repo.get!(Propietario, propietario.id)

      assert propietario.nombre == @valid_attrs[:nombre]
      assert propietario.cedula == @valid_attrs[:cedula]
    end
  end
end
