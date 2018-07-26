defmodule Prueba_Liftit.Repo.Migrations.VehiculoPerteneceAPropietario do
  use Ecto.Migration

  def change do
    alter table(:vehiculos) do
      add :propietario_id, references(:propietarios)
    end
  end
end
