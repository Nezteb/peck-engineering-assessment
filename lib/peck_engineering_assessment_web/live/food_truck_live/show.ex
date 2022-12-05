defmodule PeckEngineeringAssessmentWeb.FoodTruckLive.Show do
  use PeckEngineeringAssessmentWeb, :live_view

  alias PeckEngineeringAssessment.FoodTrucks

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"location_id" => location_id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:food_truck, FoodTrucks.get_food_truck!(location_id))}
  end

  defp page_title(:show), do: "Show Food truck"
  defp page_title(:edit), do: "Edit Food truck"
end
