defmodule PeckEngineeringAssessmentWeb.FoodTruckControllerTest do
  use PeckEngineeringAssessmentWeb.ConnCase

  import PeckEngineeringAssessment.FoodTrucksFixtures

  alias PeckEngineeringAssessment.FoodTrucks.FoodTruck

  @create_attrs %{
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
    location_id: 42,
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
  }
  @update_attrs %{
    address: "some updated address",
    applicant: "some updated applicant",
    approved: ~N[2022-12-01 21:11:00],
    block: "some updated block",
    blocklot: "some updated blocklot",
    cnn: 43,
    days_hours: "some updated days_hours",
    expiration_date: ~N[2022-12-01 21:11:00],
    facility_type: "some updated facility_type",
    fire_prevention_districts: "some updated fire_prevention_districts",
    food_items: "some updated food_items",
    latitude: "some updated latitude",
    location: "some updated location",
    location_description: "some updated location_description",
    longitude: "some updated longitude",
    lot: "some updated lot",
    neighborhoods: "some updated neighborhoods",
    noi_sent: "some updated noi_sent",
    permit: "some updated permit",
    police_districts: "some updated police_districts",
    prior_permit: 43,
    received: ~N[2022-12-01 21:11:00],
    schedule: "some updated schedule",
    status: "some updated status",
    supervisor_districts: "some updated supervisor_districts",
    x: "some updated x",
    y: "some updated y",
    zip_codes: "some updated zip_codes"
  }
  @invalid_attrs %{
    address: nil,
    applicant: nil,
    approved: nil,
    block: nil,
    blocklot: nil,
    cnn: nil,
    days_hours: nil,
    expiration_date: nil,
    facility_type: nil,
    fire_prevention_districts: nil,
    food_items: nil,
    latitude: nil,
    location: nil,
    location_description: nil,
    location_id: nil,
    longitude: nil,
    lot: nil,
    neighborhoods: nil,
    noi_sent: nil,
    permit: nil,
    police_districts: nil,
    prior_permit: nil,
    received: nil,
    schedule: nil,
    status: nil,
    supervisor_districts: nil,
    x: nil,
    y: nil,
    zip_codes: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all food_trucks", %{conn: conn} do
      conn = get(conn, Routes.food_truck_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create food_truck" do
    test "renders food_truck when data is valid", %{conn: conn} do
      conn = post(conn, Routes.food_truck_path(conn, :create), food_truck: @create_attrs)
      assert %{"location_id" => location_id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.food_truck_path(conn, :show, location_id))

      assert %{
               "address" => "some address",
               "applicant" => "some applicant",
               "approved" => "2022-11-30T21:11:00",
               "block" => "some block",
               "blocklot" => "some blocklot",
               "cnn" => 42,
               "days_hours" => "some days_hours",
               "expiration_date" => "2022-11-30T21:11:00",
               "facility_type" => "some facility_type",
               "fire_prevention_districts" => "some fire_prevention_districts",
               "food_items" => "some food_items",
               "latitude" => "some latitude",
               "location" => "some location",
               "location_description" => "some location_description",
               "location_id" => ^location_id,
               "longitude" => "some longitude",
               "lot" => "some lot",
               "neighborhoods" => "some neighborhoods",
               "noi_sent" => "some noi_sent",
               "permit" => "some permit",
               "police_districts" => "some police_districts",
               "prior_permit" => 42,
               "received" => "2022-11-30T21:11:00",
               "schedule" => "some schedule",
               "status" => "some status",
               "supervisor_districts" => "some supervisor_districts",
               "x" => "some x",
               "y" => "some y",
               "zip_codes" => "some zip_codes"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.food_truck_path(conn, :create), food_truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food_truck" do
    setup [:create_food_truck]

    test "renders food_truck when data is valid", %{
      conn: conn,
      food_truck: %FoodTruck{location_id: location_id} = food_truck
    } do
      conn =
        put(conn, Routes.food_truck_path(conn, :update, food_truck), food_truck: @update_attrs)

      assert %{"location_id" => ^location_id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.food_truck_path(conn, :show, location_id))

      assert %{
               "address" => "some updated address",
               "applicant" => "some updated applicant",
               "approved" => "2022-12-01T21:11:00",
               "block" => "some updated block",
               "blocklot" => "some updated blocklot",
               "cnn" => 43,
               "days_hours" => "some updated days_hours",
               "expiration_date" => "2022-12-01T21:11:00",
               "facility_type" => "some updated facility_type",
               "fire_prevention_districts" => "some updated fire_prevention_districts",
               "food_items" => "some updated food_items",
               "latitude" => "some updated latitude",
               "location" => "some updated location",
               "location_description" => "some updated location_description",
               "location_id" => ^location_id,
               "longitude" => "some updated longitude",
               "lot" => "some updated lot",
               "neighborhoods" => "some updated neighborhoods",
               "noi_sent" => "some updated noi_sent",
               "permit" => "some updated permit",
               "police_districts" => "some updated police_districts",
               "prior_permit" => 43,
               "received" => "2022-12-01T21:11:00",
               "schedule" => "some updated schedule",
               "status" => "some updated status",
               "supervisor_districts" => "some updated supervisor_districts",
               "x" => "some updated x",
               "y" => "some updated y",
               "zip_codes" => "some updated zip_codes"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, food_truck: food_truck} do
      conn =
        put(conn, Routes.food_truck_path(conn, :update, food_truck), food_truck: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food_truck" do
    setup [:create_food_truck]

    test "deletes chosen food_truck", %{conn: conn, food_truck: food_truck} do
      conn = delete(conn, Routes.food_truck_path(conn, :delete, food_truck))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.food_truck_path(conn, :show, food_truck))
      end
    end
  end

  defp create_food_truck(_) do
    food_truck = food_truck_fixture()
    %{food_truck: food_truck}
  end
end
