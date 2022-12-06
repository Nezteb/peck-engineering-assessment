defmodule PeckEngineeringAssessmentWeb.Router do
  use PeckEngineeringAssessmentWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PeckEngineeringAssessmentWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug OpenApiSpex.Plug.PutApiSpec, module: PeckEngineeringAssessmentWeb.ApiSpec
  end

  scope "/api" do
    pipe_through :api

    resources "/food_trucks", PeckEngineeringAssessmentWeb.FoodTruckController,
      except: [:new, :edit],
      param: "location_id"

    get "/openapi", OpenApiSpex.Plug.RenderSpec, []
  end

  scope "/" do
    pipe_through :browser

    get "/swaggerui", OpenApiSpex.Plug.SwaggerUI, path: "/api/openapi"

    live "/food_trucks", PeckEngineeringAssessmentWeb.FoodTruckLive.Index, :index
    live "/food_trucks/new", PeckEngineeringAssessmentWeb.FoodTruckLive.Index, :new
    live "/food_trucks/:location_id/edit", PeckEngineeringAssessmentWeb.FoodTruckLive.Index, :edit

    live "/food_trucks/:location_id", PeckEngineeringAssessmentWeb.FoodTruckLive.Show, :show

    live "/food_trucks/:location_id/show/edit",
         PeckEngineeringAssessmentWeb.FoodTruckLive.Show,
         :edit
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PeckEngineeringAssessmentWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
