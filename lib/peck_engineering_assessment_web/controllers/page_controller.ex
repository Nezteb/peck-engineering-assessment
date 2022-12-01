defmodule PeckEngineeringAssessmentWeb.PageController do
  use PeckEngineeringAssessmentWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
