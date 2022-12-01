defmodule PeckEngineeringAssessmentWeb.FoodTruckController do
  use PeckEngineeringAssessmentWeb, :controller

  alias PeckEngineeringAssessment.FoodTrucks
  alias PeckEngineeringAssessment.FoodTrucks.FoodTruck

  action_fallback PeckEngineeringAssessmentWeb.FallbackController

  def index(conn, _params) do
    food_trucks = FoodTrucks.list_food_trucks()
    render(conn, "index.json", food_trucks: food_trucks)
  end

  def create(conn, %{"food_truck" => food_truck_params}) do
    with {:ok, %FoodTruck{} = food_truck} <- FoodTrucks.create_food_truck(food_truck_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.food_truck_path(conn, :show, food_truck))
      |> render("show.json", food_truck: food_truck)
    end
  end

  def show(conn, %{"id" => id}) do
    food_truck = FoodTrucks.get_food_truck!(id)
    render(conn, "show.json", food_truck: food_truck)
  end

  def update(conn, %{"id" => id, "food_truck" => food_truck_params}) do
    food_truck = FoodTrucks.get_food_truck!(id)

    with {:ok, %FoodTruck{} = food_truck} <-
           FoodTrucks.update_food_truck(food_truck, food_truck_params) do
      render(conn, "show.json", food_truck: food_truck)
    end
  end

  def delete(conn, %{"id" => id}) do
    food_truck = FoodTrucks.get_food_truck!(id)

    with {:ok, %FoodTruck{}} <- FoodTrucks.delete_food_truck(food_truck) do
      send_resp(conn, :no_content, "")
    end
  end
end
