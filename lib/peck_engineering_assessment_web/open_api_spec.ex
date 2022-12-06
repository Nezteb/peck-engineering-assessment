defmodule PeckEngineeringAssessmentWeb.ApiSpec do
  @moduledoc false
  alias OpenApiSpex.{Info, OpenApi, Paths, Server}
  alias PeckEngineeringAssessmentWeb.{Endpoint, Router}
  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      servers: [
        # Populate the Server info from a phoenix endpoint
        Server.from_endpoint(Endpoint)
      ],
      info: %Info{
        title: to_string(Application.spec(:peck_engineering_assessment, :description)),
        version: to_string(Application.spec(:peck_engineering_assessment, :vsn))
      },
      # Populate the paths from a phoenix router
      paths: Paths.from_router(Router)
    }
    # Discover request/response schemas from path specs
    |> OpenApiSpex.resolve_schema_modules()
  end
end
