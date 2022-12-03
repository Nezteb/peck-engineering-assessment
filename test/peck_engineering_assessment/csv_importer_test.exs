defmodule PeckEngineeringAssessment.CsvImporterTest do
  use PeckEngineeringAssessment.DataCase
  use ExVCR.Mock, adapter: ExVCR.Adapter.Finch

  alias PeckEngineeringAssessment.CsvImporter

  setup do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    :ok
  end

  describe "csv_importer" do
    test "import succeeds" do
      use_cassette "import_food_trucks" do
        assert length(CsvImporter.import_food_trucks) == 482
      end
    end
  end
end
