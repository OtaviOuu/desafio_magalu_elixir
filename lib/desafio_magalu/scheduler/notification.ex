defmodule DesafioMagalu.Scheduler.Notification do
  use Ecto.Schema

  import Ecto.Changeset

  @fields [:destination, :send_at, :message, :type]

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "notifications" do
    field :destination, :string
    field :send_at, :utc_datetime
    field :message, :string
    field :status, Ecto.Enum, values: [:pending, :sent, :failed], default: :pending
    field :type, Ecto.Enum, values: [:email, :sms, :push, :whatsapp]
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> check_constraint(:status, name: :status_must_be_valid)
  end
end
