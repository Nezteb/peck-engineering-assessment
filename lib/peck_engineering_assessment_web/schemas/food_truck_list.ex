defmodule PeckEngineeringAssessmentWeb.Schemas.FoodTruckList do
  @moduledoc false
  alias PeckEngineeringAssessmentWeb.Schemas

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Food Truck List",
    description: "A list of food trucks",
    type: :array,
    items: Schemas.FoodTruck
  })
end
