defmodule Prueba_Liftit.Vehiculo do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Prueba_Liftit.Repo
  alias Prueba_Liftit.Vehiculo

  schema "vehiculos" do
    field :marca, :string
    field :placa, :string
    field :tipo, :string
    belongs_to :propietario, Prueba_Liftit.Propietario, foreign_key: :propietario_id

    timestamps()
  end

  @doc false
  def changeset(vehiculo, attrs) do
    vehiculo
    |> cast(attrs, [:placa, :marca, :tipo])
    |> validate_required([:placa, :marca, :tipo])
    |> unique_constraint(:placa)
  end

  def create_vehiculo(attrs \\ %{}) do
    IO.inspect attrs
    %Vehiculo{}
    |> Vehiculo.changeset(attrs)
    # |> Repo.insert()
  end

  def list_vehiculos do
    Repo.all from v in Vehiculo, preload: [:propietario]
  end

  @doc """
  Gets a single vehiculo.

  Raises `Ecto.NoResultsError` if the Vehiculo does not exist.

  ## Examples

      iex> get_vehiculo!(123)
      %Vehiculo{}

      iex> get_vehiculo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vehiculo!(id) do
    Repo.get!(Vehiculo, id)
    |> Repo.preload(:propietario)
  end

  @doc """
  Updates a vehiculo.

  ## Examples

      iex> update_vehiculo(vehiculo, %{field: new_value})
      {:ok, %Vehiculo{}}

      iex> update_vehiculo(vehiculo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vehiculo(%Vehiculo{} = vehiculo, attrs) do
    vehiculo
    |> Vehiculo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Vehiculo.

  ## Examples

      iex> delete_vehiculo(vehiculo)
      {:ok, %Vehiculo{}}

      iex> delete_vehiculo(vehiculo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vehiculo(%Vehiculo{} = vehiculo) do
    Repo.delete(vehiculo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vehiculo changes.

  ## Examples

      iex> change_vehiculo(vehiculo)
      %Ecto.Changeset{source: %Vehiculo{}}

  """
  def change_vehiculo(%Vehiculo{} = vehiculo) do
    Vehiculo.changeset(vehiculo, %{})
  end

  def change_vehiculo(%Vehiculo{} = vehiculo, propietario_id) do
    Vehiculo.changeset(vehiculo, %{propietario: propietario_id})
  end
end
