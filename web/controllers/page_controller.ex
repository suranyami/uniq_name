defmodule UniqName.PageController do
  use UniqName.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
