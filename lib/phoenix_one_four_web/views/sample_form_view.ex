defmodule PhoenixOneFourWeb.SampleFormView do
  use PhoenixOneFourWeb, :view

  import Phoenix.LiveView, only: [sigil_L: 2]

  def render("no_phx_click.html", assigns) do
    ~L"""
    <%= f = form_for @changeset, "#", [phx_change: :validate] %>
      <%= label f, :name %>
      <%= text_input f, :name %>
      <%= error_tag f, :name %>

      <%= label f, :accepted %>
      <%= checkbox f, :accepted %>
      <%= error_tag f, :accepted %>
    </form>
    """
  end

  def render("phx_click_around_checkbox.html", assigns) do
    ~L"""
    <%= f = form_for @changeset, "#", [phx_change: :validate] %>
      <%= label f, :name %>
      <%= text_input f, :name %>
      <%= error_tag f, :name %>

      <div phx-click="div_clicked">
      <%= label f, :accepted %>
      <%= checkbox f, :accepted %>
      <%= error_tag f, :accepted %>
      </div>
    </form>
    """
  end

  def render("phx_click_around_both_inputs.html", assigns) do
    ~L"""
    <%= f = form_for @changeset, "#", [phx_change: :validate] %>
      <div phx-click="div_clicked">
        <%= label f, :name %>
        <%= text_input f, :name %>
        <%= error_tag f, :name %>

        <%= label f, :accepted %>
        <%= checkbox f, :accepted %>
        <%= error_tag f, :accepted %>
      </div>
    </form>
    """
  end

  def render("phx_click_outside_form.html", assigns) do
    ~L"""
    <div phx-click="div_clicked">
      <%= f = form_for @changeset, "#", [phx_change: :validate] %>
        <%= label f, :name %>
        <%= text_input f, :name %>
        <%= error_tag f, :name %>

        <%= label f, :accepted %>
        <%= checkbox f, :accepted %>
        <%= error_tag f, :accepted %>
      </form>
    </div>
    """
  end
end
