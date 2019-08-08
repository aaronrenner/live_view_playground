defmodule PhoenixOneFourWeb.SampleFormLive do
  use Phoenix.HTML
  use Phoenix.LiveView

  import PhoenixOneFourWeb.ErrorHelpers

  alias PhoenixOneFourWeb.SampleFormView

  defmodule SampleForm do
    use Ecto.Schema

    import Ecto.Changeset

    embedded_schema do
      field :name, :string
      field :accepted, :boolean
    end

    def changeset(params \\ %{}) do
      %__MODULE__{}
      |> cast(params, [:name, :accepted])
      |> validate_required([:name, :accepted])
      |> validate_length(:name, min: 4)
    end
  end

  def render(%{template: template} = assigns) do
    Phoenix.View.render(SampleFormView, template, assigns)
  end

  def mount(%{template: template}, socket) do
    changeset = SampleForm.changeset()

    {:ok, assign(socket, changeset: changeset, template: template)}
  end

  def handle_event("div_clicked" = event, value, socket) do
    IO.inspect(event, label: socket.assigns.template)

    {:noreply, socket}
  end

  def handle_event("validate", %{"sample_form" => params}, socket) do
    changeset =
      params
      |> SampleForm.changeset()
      |> Map.put(:action, :insert)

    IO.inspect(changeset.changes, label: socket.assigns.template)

    {:noreply, assign(socket, changeset: changeset)}
  end
end
