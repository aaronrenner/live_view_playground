defmodule PhoenixOneFourWeb.PushStateDemoLive do
  use Phoenix.LiveView
  alias PhoenixOneFourWeb.Router.Helpers, as: Routes

  alias PhoenixOneFourWeb.PushStateDemoView

  require Logger

  def mount(_session, socket) do
    count = 0
    {:ok, assign(socket, count: count)}
  end

  def render(assigns) do
    Phoenix.View.render(PushStateDemoView, "index.html", assigns)
  end

  def handle_params(params, _uri, socket) do
    Logger.debug(fn -> "handle params: #{inspect(params)}" end)

    with {:ok, count_param} <- Map.fetch(params, "count"),
         {count, _rest} <- Integer.parse(count_param) do
      {:noreply, assign(socket, count: count)}
    else
      _ ->
        {:noreply, socket}
    end
  end

  def handle_event("increment", _val, socket) do
    count = socket.assigns.count + 1

    socket = update_count_in_url(socket, count)

    {:noreply, socket}
  end

  def handle_event("decrement", _val, socket) do
    count = socket.assigns.count - 1

    socket = update_count_in_url(socket, count)

    {:noreply, socket}
  end

  defp update_count_in_url(socket, count) do
    live_redirect(socket, to: Routes.live_path(socket, __MODULE__, count: count))
  end
end
