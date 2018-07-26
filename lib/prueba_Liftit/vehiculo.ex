defmodule Prueba_Liftit.Vehiculo do
  use Ecto.Schema
  import Ecto.Changeset


  schema "vehiculos" do
    field :marca, :string
    field :placa, :string
    field :tipo, :string
    belongs_to :propietario, Prueba_Liftit.Propietario


    timestamps()
  end

  @doc false
  def changeset(vehiculo, attrs) do
    vehiculo
    |> cast(attrs, [:placa, :marca, :tipo])
    |> validate_required([:placa, :marca, :tipo])
    |> unique_constraint(:placa)
  end
end
