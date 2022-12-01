defmodule PeckEngineeringAssessment.FoodTrucksTest do
  use PeckEngineeringAssessment.DataCase

  alias PeckEngineeringAssessment.FoodTrucks

  describe "food_trucks" do
    alias PeckEngineeringAssessment.FoodTrucks.FoodTruck

    import PeckEngineeringAssessment.FoodTrucksFixtures

    @invalid_attrs %{address: nil, applicant: nil, approved: nil, block: nil, blocklot: nil, cnn: nil, days_hours: nil, expiration_date: nil, facility_type: nil, fire_prevention_districts: nil, food_items: nil, latitude: nil, location: nil, location_description: nil, location_id: nil, longitude: nil, lot: nil, neighborhoods: nil, noi_sent: nil, permit: nil, police_districts: nil, prior_permit: nil, received: nil, schedule: nil, status: nil, supervisor_districts: nil, x: nil, y: nil, zip_codes: nil}

    test "list_food_trucks/0 returns all food_trucks" do
      food_truck = food_truck_fixture()
      assert FoodTrucks.list_food_trucks() == [food_truck]
    end

    test "get_food_truck!/1 returns the food_truck with given id" do
      food_truck = food_truck_fixture()
      assert FoodTrucks.get_food_truck!(food_truck.id) == food_truck
    end

    test "create_food_truck/1 with valid data creates a food_truck" do
      valid_attrs = %{address: "some address", applicant: "some applicant", approved: ~N[2022-11-30 21:11:00], block: "some block", blocklot: "some blocklot", cnn: 42, days_hours: "some days_hours", expiration_date: ~N[2022-11-30 21:11:00], facility_type: "some facility_type", fire_prevention_districts: "some fire_prevention_districts", food_items: "some food_items", latitude: "some latitude", location: "some location", location_description: "some location_description", location_id: 42, longitude: "some longitude", lot: "some lot", neighborhoods: "some neighborhoods", noi_sent: "some noi_sent", permit: "some permit", police_districts: "some police_districts", prior_permit: 42, received: ~N[2022-11-30 21:11:00], schedule: "some schedule", status: "some status", supervisor_districts: "some supervisor_districts", x: "some x", y: "some y", zip_codes: "some zip_codes"}

      assert {:ok, %FoodTruck{} = food_truck} = FoodTrucks.create_food_truck(valid_attrs)
      assert food_truck.address == "some address"
      assert food_truck.applicant == "some applicant"
      assert food_truck.approved == ~N[2022-11-30 21:11:00]
      assert food_truck.block == "some block"
      assert food_truck.blocklot == "some blocklot"
      assert food_truck.cnn == 42
      assert food_truck.days_hours == "some days_hours"
      assert food_truck.expiration_date == ~N[2022-11-30 21:11:00]
      assert food_truck.facility_type == "some facility_type"
      assert food_truck.fire_prevention_districts == "some fire_prevention_districts"
      assert food_truck.food_items == "some food_items"
      assert food_truck.latitude == "some latitude"
      assert food_truck.location == "some location"
      assert food_truck.location_description == "some location_description"
      assert food_truck.location_id == 42
      assert food_truck.longitude == "some longitude"
      assert food_truck.lot == "some lot"
      assert food_truck.neighborhoods == "some neighborhoods"
      assert food_truck.noi_sent == "some noi_sent"
      assert food_truck.permit == "some permit"
      assert food_truck.police_districts == "some police_districts"
      assert food_truck.prior_permit == 42
      assert food_truck.received == ~N[2022-11-30 21:11:00]
      assert food_truck.schedule == "some schedule"
      assert food_truck.status == "some status"
      assert food_truck.supervisor_districts == "some supervisor_districts"
      assert food_truck.x == "some x"
      assert food_truck.y == "some y"
      assert food_truck.zip_codes == "some zip_codes"
    end

    test "create_food_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FoodTrucks.create_food_truck(@invalid_attrs)
    end

    test "update_food_truck/2 with valid data updates the food_truck" do
      food_truck = food_truck_fixture()
      update_attrs = %{address: "some updated address", applicant: "some updated applicant", approved: ~N[2022-12-01 21:11:00], block: "some updated block", blocklot: "some updated blocklot", cnn: 43, days_hours: "some updated days_hours", expiration_date: ~N[2022-12-01 21:11:00], facility_type: "some updated facility_type", fire_prevention_districts: "some updated fire_prevention_districts", food_items: "some updated food_items", latitude: "some updated latitude", location: "some updated location", location_description: "some updated location_description", location_id: 43, longitude: "some updated longitude", lot: "some updated lot", neighborhoods: "some updated neighborhoods", noi_sent: "some updated noi_sent", permit: "some updated permit", police_districts: "some updated police_districts", prior_permit: 43, received: ~N[2022-12-01 21:11:00], schedule: "some updated schedule", status: "some updated status", supervisor_districts: "some updated supervisor_districts", x: "some updated x", y: "some updated y", zip_codes: "some updated zip_codes"}

      assert {:ok, %FoodTruck{} = food_truck} = FoodTrucks.update_food_truck(food_truck, update_attrs)
      assert food_truck.address == "some updated address"
      assert food_truck.applicant == "some updated applicant"
      assert food_truck.approved == ~N[2022-12-01 21:11:00]
      assert food_truck.block == "some updated block"
      assert food_truck.blocklot == "some updated blocklot"
      assert food_truck.cnn == 43
      assert food_truck.days_hours == "some updated days_hours"
      assert food_truck.expiration_date == ~N[2022-12-01 21:11:00]
      assert food_truck.facility_type == "some updated facility_type"
      assert food_truck.fire_prevention_districts == "some updated fire_prevention_districts"
      assert food_truck.food_items == "some updated food_items"
      assert food_truck.latitude == "some updated latitude"
      assert food_truck.location == "some updated location"
      assert food_truck.location_description == "some updated location_description"
      assert food_truck.location_id == 43
      assert food_truck.longitude == "some updated longitude"
      assert food_truck.lot == "some updated lot"
      assert food_truck.neighborhoods == "some updated neighborhoods"
      assert food_truck.noi_sent == "some updated noi_sent"
      assert food_truck.permit == "some updated permit"
      assert food_truck.police_districts == "some updated police_districts"
      assert food_truck.prior_permit == 43
      assert food_truck.received == ~N[2022-12-01 21:11:00]
      assert food_truck.schedule == "some updated schedule"
      assert food_truck.status == "some updated status"
      assert food_truck.supervisor_districts == "some updated supervisor_districts"
      assert food_truck.x == "some updated x"
      assert food_truck.y == "some updated y"
      assert food_truck.zip_codes == "some updated zip_codes"
    end

    test "update_food_truck/2 with invalid data returns error changeset" do
      food_truck = food_truck_fixture()
      assert {:error, %Ecto.Changeset{}} = FoodTrucks.update_food_truck(food_truck, @invalid_attrs)
      assert food_truck == FoodTrucks.get_food_truck!(food_truck.id)
    end

    test "delete_food_truck/1 deletes the food_truck" do
      food_truck = food_truck_fixture()
      assert {:ok, %FoodTruck{}} = FoodTrucks.delete_food_truck(food_truck)
      assert_raise Ecto.NoResultsError, fn -> FoodTrucks.get_food_truck!(food_truck.id) end
    end

    test "change_food_truck/1 returns a food_truck changeset" do
      food_truck = food_truck_fixture()
      assert %Ecto.Changeset{} = FoodTrucks.change_food_truck(food_truck)
    end
  end
end
