defmodule PeckEngineeringAssessment.FoodTrucks do
  @moduledoc """
  The FoodTrucks context.
  """

  import Ecto.Query, warn: false
  alias PeckEngineeringAssessment.Repo

  alias PeckEngineeringAssessment.FoodTrucks.FoodTruck

  @doc """
  Returns the list of food_trucks.

  ## Examples

      iex> list_food_trucks()
      [%FoodTruck{}, ...]

  """
  def list_food_trucks do
    Repo.all(FoodTruck)
  end

  @doc """
  Gets a single food_truck.

  Raises `Ecto.NoResultsError` if the Food truck does not exist.

  ## Examples

      iex> get_food_truck!(123)
      %FoodTruck{}

      iex> get_food_truck!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food_truck!(id), do: Repo.get!(FoodTruck, id)

  @doc """
  Creates a food_truck.

  ## Examples

      iex> create_food_truck(%{field: value})
      {:ok, %FoodTruck{}}

      iex> create_food_truck(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food_truck(attrs \\ %{}) do
    %FoodTruck{}
    |> FoodTruck.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food_truck.

  ## Examples

      iex> update_food_truck(food_truck, %{field: new_value})
      {:ok, %FoodTruck{}}

      iex> update_food_truck(food_truck, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food_truck(%FoodTruck{} = food_truck, attrs) do
    food_truck
    |> FoodTruck.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a food_truck.

  ## Examples

      iex> delete_food_truck(food_truck)
      {:ok, %FoodTruck{}}

      iex> delete_food_truck(food_truck)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food_truck(%FoodTruck{} = food_truck) do
    Repo.delete(food_truck)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food_truck changes.

  ## Examples

      iex> change_food_truck(food_truck)
      %Ecto.Changeset{data: %FoodTruck{}}

  """
  def change_food_truck(%FoodTruck{} = food_truck, attrs \\ %{}) do
    FoodTruck.changeset(food_truck, attrs)
  end
end
