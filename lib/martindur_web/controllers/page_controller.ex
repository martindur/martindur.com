defmodule MartindurWeb.PageController do
  use MartindurWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.

    projects = [
      %{
        name: "ai image generator",
        description: "freepik figma plugin",
        points: [
          "full-stack development",
          "ux design",
          "user testing"
        ],
        img: ~p"/images/plugin_ai-image-generator.png",
        url:
          "https://www.figma.com/community/plugin/1253173167259963280/ai-image-generator-by-freepik"
      },
      %{
        name: "flaticon",
        description: "flaticon figma plugin",
        points: [
          "front-end development",
          "ux design",
          "user testing"
        ],
        img: ~p"/images/plugin_flaticon.png",
        url: "https://www.figma.com/community/plugin/1183020129233350982/flaticon-by-freepik"
      },
      %{
        name: "iconfinder",
        description: "web marketplace for icons & illustrations",
        points: [
          "full-stack development",
          "rest api",
          "infrastructure"
        ],
        img: ~p"/images/iconfinder.png",
        url: "https://iconfinder.com"
      },
      %{
        name: "plant jammer",
        description: "web app for generating recipes",
        points: [
          "back-end development",
          "rest api",
          "graphql api",
          "infrastructure"
        ],
        img: ~p"/images/plantjammer.png",
        url: "https://plantjammer.com"
      }
    ]

    render(conn, :home, projects: projects)
  end
end
