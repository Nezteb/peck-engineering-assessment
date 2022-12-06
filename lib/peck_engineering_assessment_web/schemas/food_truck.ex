defmodule PeckEngineeringAssessmentWeb.Schemas.FoodTruck do
  @moduledoc false
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Food Truck",
    description: "A location that serves food",
    type: :object,
    properties: %{
      location_id: %Schema{
        type: :integer,
        description: "The ID assigned to this location by the city of San Francisco"
      },
      applicant: %Schema{
        type: :string,
        description: "The name of the applicant for the location license"
      },
      facility_type: %Schema{type: :string, description: "The type of facility"},
      cnn: %Schema{type: :integer, description: "Unknown"},
      location_description: %Schema{type: :string, description: "A description of the location"},
      address: %Schema{type: :string, description: "The address of the location"},
      blocklot: %Schema{
        type: :string,
        description: "The block number and lot number concatenated"
      },
      block: %Schema{type: :string, description: "The city block number of the location"},
      lot: %Schema{type: :string, description: "The city lot number of the location"},
      permit: %Schema{type: :string, description: "The permit ID assigned to the location"},
      status: %Schema{
        type: :string,
        description: "The status of the permit application of the location"
      },
      food_items: %Schema{
        type: :string,
        description: "A description of what food items are available at the location"
      },
      x: %Schema{
        type: :string,
        description: "The X coordinate of the location (unknown scale/coordinate system)"
      },
      y: %Schema{
        type: :string,
        description: "The Y coordinate of the location (unknown scale/coordinate system)"
      },
      latitude: %Schema{type: :string, description: "The global latitude of the location"},
      longitude: %Schema{type: :string, description: "The global longitude of the location"},
      schedule: %Schema{
        type: :string,
        description: "A URL to the published schedule/hours of the location"
      },
      days_hours: %Schema{
        type: :string,
        description: "Which days/hours the location is operational"
      },
      noi_sent: %Schema{type: :string, description: "Unknown"},
      approved: %Schema{
        type: :string,
        description: "The date the location's permit application was approved",
        format: :"date-time"
      },
      received: %Schema{
        type: :integer,
        description: "The date the location's permit application was received",
        format: :"date-time"
      },
      prior_permit: %Schema{
        type: :string,
        description: "Whether or not the location has been assigned a permit before"
      },
      expiration_date: %Schema{
        type: :string,
        description: "When the location's permit expires",
        format: :"date-time"
      },
      location: %Schema{
        type: :string,
        description: "The location's latitude and longitude wrapped in parentheses"
      },
      fire_prevention_districts: %Schema{
        type: :string,
        description: "Which fire prevention district the location is part of"
      },
      police_districts: %Schema{
        type: :string,
        description: "Which police district the location is part of"
      },
      supervisor_districts: %Schema{
        type: :string,
        description: "Which supervisor district the location is part of"
      },
      zip_codes: %Schema{type: :string, description: "The location's zip/postal code"},
      neighborhoods: %Schema{
        type: :string,
        description: "Which neighborhood the location resides in",
        deprecated: true
      },
      inserted_at: %Schema{
        type: :string,
        description: "Creation timestamp",
        format: :"date-time"
      },
      updated_at: %Schema{type: :string, description: "Update timestamp", format: :"date-time"}
    },
    required: [:location_id],
    example: %{
      "location_id" => 123,
      "applicant" => "John Doe",
      "facility_type" => "Truck",
      "cnn" => 456,
      "location_description" => "A truck that serves food",
      "address" => "111 Gate St",
      "blocklot" => "A1C4",
      "block" => "A1",
      "lot" => "C4",
      "permit" => "AAAAAAAAA",
      "status" => "APPROVED",
      "food_items" => "Tons of food",
      "x" => "123456789.45",
      "y" => "123456789.23",
      "latitude" => "37.794331003246800",
      "longitude" => "-122.39581105302300",
      "schedule" => "https://example.com/schedule.pdf",
      "days_hours" => "Mon-Fri 8am-5pm",
      "noi_sent" => "",
      "approved" => "2017-011-12T12:34:55Z",
      "received" => "2017-09-12T12:34:55Z",
      "prior_permit" => "",
      "expiration_date" => "2025-09-12T12:34:55Z",
      "location" => "(37.794331003246846, -122.39581105302317)",
      "fire_prevention_districts" => "4",
      "police_districts" => "1",
      "supervisor_districts" => "10",
      "zip_codes" => "28855",
      "neighborhoods" => "6",
      "inserted_at" => "2017-09-12T12:34:55Z",
      "updated_at" => "2017-09-13T10:11:12Z"
    }
  })
end
