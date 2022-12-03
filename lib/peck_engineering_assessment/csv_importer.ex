defmodule PeckEngineeringAssessment.CsvImporter do
  @moduledoc false

  use Timex

  alias NimbleCSV.RFC4180, as: CSV
  alias PeckEngineeringAssessment.ApiClient
  alias PeckEngineeringAssessment.FoodTrucks
  require Logger

  def import_food_trucks do
    ApiClient.get_food_trucks()
    |> CSV.parse_string()
    |> case do
      [] ->
        Logger.warn("Empty CSV parse result")

      parsed_csv when is_list(parsed_csv) ->
        Logger.info("Parsed #{length(parsed_csv)} rows")
        parsed_csv
    end
    |> parsed_csv_to_food_trucks()
    |> Enum.filter(fn food_truck -> food_truck != nil end)
    |> case do
      food_trucks when is_list(food_trucks) and length(food_trucks) > 0 ->
        Logger.info("Created #{length(food_trucks)} food trucks from CSV")
        food_trucks

      [] ->
        Logger.warn("Zero food trucks imported from CSV")

      other ->
        Logger.warn("Unknown CSV import result: #{inspect(other)}")
        other
    end
  end

  defp parsed_csv_to_food_trucks(parsed_csv) do
    parsed_csv
    |> Enum.map(fn row ->
      case row do
        [
          location_id,
          applicant,
          facility_type,
          cnn,
          location_description,
          address,
          blocklot,
          block,
          lot,
          permit,
          status,
          food_items,
          x,
          y,
          latitude,
          longitude,
          schedule,
          days_hours,
          noi_sent,
          approved,
          received,
          prior_permit,
          expiration_date,
          location,
          fire_prevention_districts,
          police_districts,
          supervisor_districts,
          zip_codes,
          neighborhoods
        ] ->
          approved = parse_datetime(approved, "approved", "%m/%d/%Y %H:%M:%S %p")
          received = parse_datetime(received, "received", "%Y%m%d")

          expiration_date =
            parse_datetime(expiration_date, "expiration_date", "%m/%d/%Y %H:%M:%S %p")

          %{
            location_id: location_id,
            applicant: applicant,
            facility_type: facility_type,
            cnn: cnn,
            location_description: location_description,
            address: address,
            blocklot: blocklot,
            block: block,
            lot: lot,
            permit: permit,
            status: status,
            food_items: food_items,
            x: x,
            y: y,
            latitude: latitude,
            longitude: longitude,
            schedule: schedule,
            days_hours: days_hours,
            noi_sent: noi_sent,
            approved: approved,
            received: received,
            prior_permit: prior_permit,
            expiration_date: expiration_date,
            location: location,
            fire_prevention_districts: fire_prevention_districts,
            police_districts: police_districts,
            supervisor_districts: supervisor_districts,
            zip_codes: zip_codes,
            neighborhoods: neighborhoods
          }
          |> FoodTrucks.create_food_truck()
          |> log_csv_food_truck_result(location_id)

        other ->
          Logger.error("Unknown CSV row format: #{inspect(other)}")
          nil
      end
    end)
  end

  defp log_csv_food_truck_result(result, location_id) do
    case result do
      {:ok, food_truck} ->
        Logger.info("Created food truck from CSV with ID: #{location_id}")
        food_truck

      {:error, error} ->
        Logger.error("Error creating food truck from CSV with ID: #{location_id}, error: #{inspect(error.errors)}")
        nil
    end
  end

  defp parse_datetime(string, name, format) do
    case Timex.parse(string, format, :strftime) do
      {:ok, datetime} ->
        datetime

      {:error, error} ->
        Logger.error(
          "Error parsing '#{name}' from CSV. Setting to 'nil'. String: #{inspect(string)}, error: #{inspect(error)}"
        )

        nil
    end
  end
end
