defmodule PeckEngineeringAssessment.FoodTrucksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PeckEngineeringAssessment.FoodTrucks` context.
  """

  @doc """
  Generate a food_truck.
  """
  def food_truck_fixture(attrs \\ %{}) do
    {:ok, food_truck} =
      attrs
      |> Enum.into(%{
        location_id: 42,
        address: "some address",
        applicant: "some applicant",
        approved: ~N[2022-11-30 21:11:00],
        block: "some block",
        blocklot: "some blocklot",
        cnn: 42,
        days_hours: "some days_hours",
        expiration_date: ~N[2022-11-30 21:11:00],
        facility_type: "some facility_type",
        fire_prevention_districts: "some fire_prevention_districts",
        food_items: "some food_items",
        latitude: "some latitude",
        location: "some location",
        location_description: "some location_description",
        longitude: "some longitude",
        lot: "some lot",
        neighborhoods: "some neighborhoods",
        noi_sent: "some noi_sent",
        permit: "some permit",
        police_districts: "some police_districts",
        prior_permit: 42,
        received: ~N[2022-11-30 21:11:00],
        schedule: "some schedule",
        status: "some status",
        supervisor_districts: "some supervisor_districts",
        x: "some x",
        y: "some y",
        zip_codes: "some zip_codes"
      })
      |> PeckEngineeringAssessment.FoodTrucks.create_food_truck()

    food_truck
  end
end
