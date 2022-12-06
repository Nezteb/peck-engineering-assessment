defmodule PeckEngineeringAssessmentWeb.FoodTruckController do
  use PeckEngineeringAssessmentWeb, :controller

  alias PeckEngineeringAssessment.FoodTrucks
  alias PeckEngineeringAssessment.FoodTrucks.FoodTruck

  use OpenApiSpex.ControllerSpecs
  alias PeckEngineeringAssessmentWeb.Schemas

  action_fallback PeckEngineeringAssessmentWeb.FallbackController

  operation :index,
    summary: "List all food trucks",
    responses: [
      ok: {"Food truck list response", "application/json", Schemas.FoodTruckList}
    ]

  def index(conn, _params) do
    food_trucks = FoodTrucks.list_food_trucks()
    render(conn, "index.json", food_trucks: food_trucks)
  end

  operation :create,
    summary: "Create a food truck",
    request_body: {"Food trucks params", "application/json", Schemas.FoodTruck},
    responses: [
      ok: {"Food truck response", "application/json", Schemas.FoodTruck}
    ]

  def create(conn, %{"food_truck" => food_truck_params}) do
    with {:ok, %FoodTruck{} = food_truck} <- FoodTrucks.create_food_truck(food_truck_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.food_truck_path(conn, :show, food_truck))
      |> render("show.json", food_truck: food_truck)
    end
  end

  operation :show,
    summary: "Show a food truck",
    parameters: [
      location_id: [in: :path, description: "Location ID", type: :integer, example: 1111]
    ],
    responses: [
      ok: {"User", "application/json", Schemas.FoodTruck}
    ]

  def show(conn, %{"location_id" => location_id}) do
    food_truck = FoodTrucks.get_food_truck!(location_id)
    render(conn, "show.json", food_truck: food_truck)
  end

  operation :update,
    summary: "Update a food truck",
    parameters: [
      location_id: [in: :path, description: "Location ID", type: :integer, example: 1111]
    ],
    request_body: {"Food trucks params", "application/json", Schemas.FoodTruck},
    responses: [
      ok: {"Food truck response", "application/json", Schemas.FoodTruck}
    ]

  def update(conn, %{"location_id" => location_id, "food_truck" => food_truck_params}) do
    food_truck = FoodTrucks.get_food_truck!(location_id)

    with {:ok, %FoodTruck{} = food_truck} <-
           FoodTrucks.update_food_truck(food_truck, food_truck_params) do
      render(conn, "show.json", food_truck: food_truck)
    end
  end

  operation :delete,
    summary: "Delete a food truck",
    parameters: [
      location_id: [in: :path, description: "Location ID", type: :integer, example: 1111]
    ],
    request_body: {"Food trucks params", "application/json", Schemas.FoodTruck},
    responses: [
      ok: {"Food truck response", "application/json", Schemas.FoodTruck}
    ]

  def delete(conn, %{"location_id" => location_id}) do
    food_truck = FoodTrucks.get_food_truck!(location_id)

    with {:ok, %FoodTruck{}} <- FoodTrucks.delete_food_truck(food_truck) do
      send_resp(conn, :no_content, "")
    end
  end
end
