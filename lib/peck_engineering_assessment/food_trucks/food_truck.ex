defmodule PeckEngineeringAssessment.FoodTrucks.FoodTruck do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:location_id, :id, autogenerate: true}
  @derive {Phoenix.Param, key: :location_id}

  schema "food_trucks" do
    # field :location_id, :integer, primary_key: true
    field :address, :string
    field :applicant, :string
    field :approved, :utc_datetime
    field :block, :string
    field :blocklot, :string
    field :cnn, :integer
    field :days_hours, :string
    field :expiration_date, :utc_datetime
    field :facility_type, :string
    field :fire_prevention_districts, :string
    field :food_items, :string
    field :latitude, :string
    field :location, :string
    field :location_description, :string
    field :longitude, :string
    field :lot, :string
    field :neighborhoods, :string
    field :noi_sent, :string
    field :permit, :string
    field :police_districts, :string
    field :prior_permit, :integer
    field :received, :utc_datetime
    field :schedule, :string
    field :status, :string
    field :supervisor_districts, :string
    field :x, :string
    field :y, :string
    field :zip_codes, :string

    timestamps()
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [
      :location_id,
      :applicant,
      :facility_type,
      :cnn,
      :location_description,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :food_items,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :days_hours,
      :noi_sent,
      :approved,
      :received,
      :prior_permit,
      :expiration_date,
      :location,
      :fire_prevention_districts,
      :police_districts,
      :supervisor_districts,
      :zip_codes,
      :neighborhoods
    ])
    |> validate_required([
      :location_id
    ])
    |> unique_constraint(:location_id)
  end
end
