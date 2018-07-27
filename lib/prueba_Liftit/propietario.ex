defmodule Prueba_Liftit.Propietario do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Prueba_Liftit.Repo
  alias Prueba_Liftit.Propietario

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

  @doc """
  Creates a propietario.

  ## Examples

      iex> create_propietario(%{field: value})
      {:ok, %Propietario{}}

      iex> create_propietario(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_propietario(attrs \\ %{}) do
    %Propietario{}
    |> Propietario.changeset(attrs)
    |> Repo.insert()
  end

  # def create_propietario(%Propietario{} = propietario, attrs) do
  #   propietario
  #   |> changeset(attrs)
  #   |> Repo.insert
  # end

  def list_propietarios do
    Repo.all from p in Propietario, preload: [:vehiculos]
  end

  @doc """
  Gets a single propietario.

  Raises `Ecto.NoResultsError` if the Propietario does not exist.

  ## Examples

      iex> get_propietario!(123)
      %Propietario{}

      iex> get_propietario!(456)
      ** (Ecto.NoResultsError)

  """
  def get_propietario!(id) do
    Repo.get!(Propietario, id)
    |> Repo.preload(:vehiculos)
  end


  @doc """
  Updates a propietario.

  ## Examples

      iex> update_propietario(propietario, %{field: new_value})
      {:ok, %Propietario{}}

      iex> update_propietario(propietario, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_propietario(%Propietario{} = propietario, attrs) do
    propietario
    |> Propietario.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Propietario.

  ## Examples

      iex> delete_propietario(propietario)
      {:ok, %Propietario{}}

      iex> delete_propietario(propietario)
      {:error, %Ecto.Changeset{}}

  """
  def delete_propietario(%Propietario{} = propietario) do
    Repo.delete(propietario)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking propietario changes.

  ## Examples

      iex> change_propietario(propietario)
      %Ecto.Changeset{source: %Propietario{}}

  """
  def change_propietario(%Propietario{} = propietario) do
    Propietario.changeset(propietario, %{})
  end

end
