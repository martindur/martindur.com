defmodule MartindurWeb.PageController do
  use MartindurWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.

    projects = [
      %{
        name: "Foo"
      },
      %{
        name: "Bar"
      },
      %{
        name: "Baz"
      }
    ]

    render(conn, :home, projects: projects)
  end
end
