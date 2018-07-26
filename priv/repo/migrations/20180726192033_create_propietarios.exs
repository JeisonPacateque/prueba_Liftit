defmodule Prueba_Liftit.Repo.Migrations.CreatePropietarios do
  use Ecto.Migration

  def change do
    create table(:propietarios) do
      add :nombre, :string
      add :cedula, :string

      timestamps()
    end

    create unique_index(:propietarios, [:cedula])
  end
end
