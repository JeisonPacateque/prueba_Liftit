defmodule Prueba_Liftit.Search do
  import Ecto.Repo
  import Ecto.Query
  alias Prueba_Liftit.Repo
  alias Prueba_Liftit.Propietario


  def search(search_term) do
    wildcard_search = "%#{search_term}%"

    %{vehiculos: query_vehiculos(search_term) |> Repo.all(),
    propietarios: query_propietarios(search_term) |> Repo.all()}

  end

  defp query_vehiculos(term) do
    from v in "vehiculos",
      where: ilike(v.placa, ^term),
      select: v.id
  end

  defp query_propietarios(term) do
    from p in "propietarios",
      where: ilike(p.nombre, ^term),
      or_where: ilike(p.cedula, ^term),
      select: p.id
  end
end
