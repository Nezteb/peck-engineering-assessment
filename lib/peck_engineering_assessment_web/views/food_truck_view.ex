defmodule PeckEngineeringAssessmentWeb.FoodTruckView do
  use PeckEngineeringAssessmentWeb, :view
  alias PeckEngineeringAssessmentWeb.FoodTruckView

  def render("index.json", %{food_trucks: food_trucks}) do
    %{data: render_many(food_trucks, FoodTruckView, "food_truck.json")}
  end

  def render("show.json", %{food_truck: food_truck}) do
    %{data: render_one(food_truck, FoodTruckView, "food_truck.json")}
  end

  def render("food_truck.json", %{food_truck: food_truck}) do
    %{
      location_id: food_truck.location_id,
      applicant: food_truck.applicant,
      facility_type: food_truck.facility_type,
      cnn: food_truck.cnn,
      location_description: food_truck.location_description,
      address: food_truck.address,
      blocklot: food_truck.blocklot,
      block: food_truck.block,
      lot: food_truck.lot,
      permit: food_truck.permit,
      status: food_truck.status,
      food_items: food_truck.food_items,
      x: food_truck.x,
      y: food_truck.y,
      latitude: food_truck.latitude,
      longitude: food_truck.longitude,
      schedule: food_truck.schedule,
      days_hours: food_truck.days_hours,
      noi_sent: food_truck.noi_sent,
      approved: food_truck.approved,
      received: food_truck.received,
      prior_permit: food_truck.prior_permit,
      expiration_date: food_truck.expiration_date,
      location: food_truck.location,
      fire_prevention_districts: food_truck.fire_prevention_districts,
      police_districts: food_truck.police_districts,
      supervisor_districts: food_truck.supervisor_districts,
      zip_codes: food_truck.zip_codes,
      neighborhoods: food_truck.neighborhoods
    }
  end
end
