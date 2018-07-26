defmodule Prueba_Liftit.Repo.Migrations.CreateVehiculos do
  use Ecto.Migration

  def change do
    create table(:vehiculos) do
      add :placa, :string
      add :marca, :string
      add :tipo, :string

      timestamps()
    end

    create unique_index(:vehiculos, [:placa])
  end
end
