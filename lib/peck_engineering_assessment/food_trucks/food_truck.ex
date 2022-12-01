defmodule PeckEngineeringAssessment.FoodTrucks.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :address, :string
    field :applicant, :string
    field :approved, :naive_datetime
    field :block, :string
    field :blocklot, :string
    field :cnn, :integer
    field :days_hours, :string
    field :expiration_date, :naive_datetime
    field :facility_type, :string
    field :fire_prevention_districts, :string
    field :food_items, :string
    field :latitude, :string
    field :location, :string
    field :location_description, :string
    field :location_id, :integer
    field :longitude, :string
    field :lot, :string
    field :neighborhoods, :string
    field :noi_sent, :string
    field :permit, :string
    field :police_districts, :string
    field :prior_permit, :integer
    field :received, :naive_datetime
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
    |> cast(attrs, [:location_id, :applicant, :facility_type, :cnn, :location_description, :address, :blocklot, :block, :lot, :permit, :status, :food_items, :x, :y, :latitude, :longitude, :schedule, :days_hours, :noi_sent, :approved, :received, :prior_permit, :expiration_date, :location, :fire_prevention_districts, :police_districts, :supervisor_districts, :zip_codes, :neighborhoods])
    |> validate_required([:location_id, :applicant, :facility_type, :cnn, :location_description, :address, :blocklot, :block, :lot, :permit, :status, :food_items, :x, :y, :latitude, :longitude, :schedule, :days_hours, :noi_sent, :approved, :received, :prior_permit, :expiration_date, :location, :fire_prevention_districts, :police_districts, :supervisor_districts, :zip_codes, :neighborhoods])
  end
end
