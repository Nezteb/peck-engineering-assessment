defmodule PeckEngineeringAssessmentWeb.FoodTruckLiveTest do
  use PeckEngineeringAssessmentWeb.ConnCase

  import Phoenix.LiveViewTest
  import PeckEngineeringAssessment.FoodTrucksFixtures

  @create_attrs %{
    address: "some address",
    applicant: "some applicant",
    approved: %{day: 4, hour: 23, minute: 47, month: 12, year: 2022},
    block: "some block",
    blocklot: "some blocklot",
    cnn: 42,
    days_hours: "some days_hours",
    expiration_date: %{day: 4, hour: 23, minute: 47, month: 12, year: 2022},
    facility_type: "some facility_type",
    fire_prevention_districts: "some fire_prevention_districts",
    food_items: "some food_items",
    latitude: "some latitude",
    location: "some location",
    location_description: "some location_description",
    location_id: 43,
    longitude: "some longitude",
    lot: "some lot",
    neighborhoods: "some neighborhoods",
    noi_sent: "some noi_sent",
    permit: "some permit",
    police_districts: "some police_districts",
    prior_permit: 42,
    received: %{day: 4, hour: 23, minute: 47, month: 12, year: 2022},
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
    approved: %{day: 5, hour: 23, minute: 47, month: 12, year: 2022},
    block: "some updated block",
    blocklot: "some updated blocklot",
    cnn: 43,
    days_hours: "some updated days_hours",
    expiration_date: %{day: 5, hour: 23, minute: 47, month: 12, year: 2022},
    facility_type: "some updated facility_type",
    fire_prevention_districts: "some updated fire_prevention_districts",
    food_items: "some updated food_items",
    latitude: "some updated latitude",
    location: "some updated location",
    location_description: "some updated location_description",
    location_id: 42,
    longitude: "some updated longitude",
    lot: "some updated lot",
    neighborhoods: "some updated neighborhoods",
    noi_sent: "some updated noi_sent",
    permit: "some updated permit",
    police_districts: "some updated police_districts",
    prior_permit: 43,
    received: %{day: 5, hour: 23, minute: 47, month: 12, year: 2022},
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
    approved: %{day: 30, hour: 23, minute: 47, month: 2, year: 2022},
    block: nil,
    blocklot: nil,
    cnn: nil,
    days_hours: nil,
    expiration_date: %{day: 30, hour: 23, minute: 47, month: 2, year: 2022},
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
    received: %{day: 30, hour: 23, minute: 47, month: 2, year: 2022},
    schedule: nil,
    status: nil,
    supervisor_districts: nil,
    x: nil,
    y: nil,
    zip_codes: nil
  }

  defp create_food_truck(_) do
    food_truck = food_truck_fixture()
    %{food_truck: food_truck}
  end

  describe "Index" do
    setup [:create_food_truck]

    test "lists all food_trucks", %{conn: conn, food_truck: food_truck} do
      {:ok, _index_live, html} = live(conn, Routes.food_truck_index_path(conn, :index))

      assert html =~ "Listing Food trucks"
      assert html =~ food_truck.address
    end

    test "saves new food_truck", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.food_truck_index_path(conn, :index))

      assert index_live |> element("a", "New Food truck") |> render_click() =~
               "New Food truck"

      assert_patch(index_live, Routes.food_truck_index_path(conn, :new))

      assert index_live
             |> form("#food_truck-form", food_truck: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#food_truck-form", food_truck: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.food_truck_index_path(conn, :index))

      assert html =~ "Food truck created successfully"
      assert html =~ "some address"
    end

    test "updates food_truck in listing", %{conn: conn, food_truck: food_truck} do
      {:ok, index_live, _html} = live(conn, Routes.food_truck_index_path(conn, :index))

      assert index_live
             |> element("#food_truck-#{food_truck.location_id} a", "Edit")
             |> render_click() =~
               "Edit Food truck"

      assert_patch(index_live, Routes.food_truck_index_path(conn, :edit, food_truck))

      assert index_live
             |> form("#food_truck-form", food_truck: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#food_truck-form", food_truck: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.food_truck_index_path(conn, :index))

      assert html =~ "Food truck updated successfully"
      assert html =~ "some updated address"
    end

    test "deletes food_truck in listing", %{conn: conn, food_truck: food_truck} do
      {:ok, index_live, _html} = live(conn, Routes.food_truck_index_path(conn, :index))

      assert index_live
             |> element("#food_truck-#{food_truck.location_id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#food_truck-#{food_truck.location_id}")
    end
  end

  describe "Show" do
    setup [:create_food_truck]

    test "displays food_truck", %{conn: conn, food_truck: food_truck} do
      {:ok, _show_live, html} = live(conn, Routes.food_truck_show_path(conn, :show, food_truck))

      assert html =~ "Show Food truck"
      assert html =~ food_truck.address
    end

    test "updates food_truck within modal", %{conn: conn, food_truck: food_truck} do
      {:ok, show_live, _html} = live(conn, Routes.food_truck_show_path(conn, :show, food_truck))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Food truck"

      assert_patch(show_live, Routes.food_truck_show_path(conn, :edit, food_truck))

      assert show_live
             |> form("#food_truck-form", food_truck: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#food_truck-form", food_truck: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.food_truck_show_path(conn, :show, food_truck))

      assert html =~ "Food truck updated successfully"
      assert html =~ "some updated address"
    end
  end
end
