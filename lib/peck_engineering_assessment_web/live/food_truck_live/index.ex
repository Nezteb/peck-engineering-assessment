defmodule PeckEngineeringAssessmentWeb.FoodTruckLive.Index do
  use PeckEngineeringAssessmentWeb, :live_view

  alias PeckEngineeringAssessment.FoodTrucks
  alias PeckEngineeringAssessment.FoodTrucks.FoodTruck

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :food_trucks, list_food_trucks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"location_id" => location_id}) do
    socket
    |> assign(:page_title, "Edit Food truck")
    |> assign(:food_truck, FoodTrucks.get_food_truck!(location_id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Food truck")
    |> assign(:food_truck, %FoodTruck{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Food trucks")
    |> assign(:food_truck, nil)
  end

  @impl true
  def handle_event("delete", %{"location_id" => location_id}, socket) do
    food_truck = FoodTrucks.get_food_truck!(location_id)
    {:ok, _} = FoodTrucks.delete_food_truck(food_truck)

    {:noreply, assign(socket, :food_trucks, list_food_trucks())}
  end

  defp list_food_trucks do
    FoodTrucks.list_food_trucks()
  end
end
