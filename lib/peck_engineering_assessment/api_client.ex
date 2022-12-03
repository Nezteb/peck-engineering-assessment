defmodule PeckEngineeringAssessment.ApiClient do
  @moduledoc false

  use Tesla
  require Logger

  plug Tesla.Middleware.BaseUrl,
       Application.fetch_env!(:peck_engineering_assessment, :food_trucks_url)

  plug Tesla.Middleware.Headers, [
    {"accept", "application/csv"}
  ]

  def get_food_trucks do
    case get("/api/views/rqzj-sfat/rows.csv") do
      {:ok, result} ->
        Logger.info("Retrieved CSV of size: #{String.length(result.body)} characters")
        result.body

      other ->
        Logger.error("Error fetching food trucks: #{inspect(other)}")
    end
  end
end
