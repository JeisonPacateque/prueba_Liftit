defmodule Prueba_Liftit.Propietario do
  use Ecto.Schema
  import Ecto.Changeset


  schema "propietarios" do
    field :cedula, :string
    field :nombre, :string
    has_many :vehiculos, Prueba_Liftit.Vehiculo

    timestamps()
  end

  @doc false
  def changeset(propietario, attrs) do
    propietario
    |> cast(attrs, [:nombre, :cedula])
    |> validate_required([:nombre, :cedula])
    |> unique_constraint(:cedula)
  end
end
