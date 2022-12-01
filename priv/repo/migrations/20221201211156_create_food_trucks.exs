defmodule PeckEngineeringAssessment.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :location_id, :integer
      add :applicant, :string
      add :facility_type, :string
      add :cnn, :integer
      add :location_description, :string
      add :address, :string
      add :blocklot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :string
      add :x, :string
      add :y, :string
      add :latitude, :string
      add :longitude, :string
      add :schedule, :string
      add :days_hours, :string
      add :noi_sent, :string
      add :approved, :naive_datetime
      add :received, :naive_datetime
      add :prior_permit, :integer
      add :expiration_date, :naive_datetime
      add :location, :string
      add :fire_prevention_districts, :string
      add :police_districts, :string
      add :supervisor_districts, :string
      add :zip_codes, :string
      add :neighborhoods, :string

      timestamps()
    end
  end
end
