defmodule HelloAshWeb.Groups.GroupLive do
  use HelloAshWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        form: AshPhoenix.Form.for_create(HelloAsh.Network.Group, :create) |> to_form()
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.simple_form for={@form} phx-change="validate" phx-submit="submit">
      <.input type="text" label="Group name" field={@form[:name]} />

      <.button>Save</.button>
    </.simple_form>
    """
  end

  def handle_event("validate", %{"form" => params}, socket) do
    form = AshPhoenix.Form.validate(socket.assigns.form, params)
    {:noreply, assign(socket, :form, form)}
  end

  def handle_event("submit", %{"form" => params}, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form, params: params) do
      {:ok, group} ->
        {:noreply, socket
      |> put_flash(:info, "Group created")}
      {:error, form} ->
        {:noreply, assign(socket, :form, form)}

    end
  end
end
