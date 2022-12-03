defmodule PeckEngineeringAssessment.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :location_id, :integer, null: false, primary_key: true
      add :applicant, :string, null: true
      add :facility_type, :string, null: true
      add :cnn, :integer, null: true
      add :location_description, :string, null: true
      add :address, :string, null: true
      add :blocklot, :string, null: true
      add :block, :string, null: true
      add :lot, :string, null: true
      add :permit, :string, null: true
      add :status, :string, null: true
      add :food_items, :text, null: true
      add :x, :string, null: true
      add :y, :string, null: true
      add :latitude, :string, null: true
      add :longitude, :string, null: true
      add :schedule, :string, null: true
      add :days_hours, :string, null: true
      add :noi_sent, :string, null: true
      add :approved, :naive_datetime, null: true
      add :received, :naive_datetime, null: true
      add :prior_permit, :integer, null: true
      add :expiration_date, :naive_datetime, null: true
      add :location, :string, null: true
      add :fire_prevention_districts, :string, null: true
      add :police_districts, :string, null: true
      add :supervisor_districts, :string, null: true
      add :zip_codes, :string, null: true
      add :neighborhoods, :string, null: true

      timestamps()
    end

    create unique_index(:food_trucks, :location_id)
  end
end
