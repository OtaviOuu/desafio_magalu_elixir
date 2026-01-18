defmodule DesafioMagalu.Repo.Migrations.AddNotificationsTables do
  use Ecto.Migration

  def change do
    create table(:notifications, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :destination, :string, null: false
      add :send_at, :utc_datetime_usec, null: false
      add :message, :text, null: false
      add :status, :string, null: false, default: "pending"
      add :type, :string, null: false
    end

    create index(:notifications, [:send_at])

    create constraint(
             :notifications,
             :status_must_be_valid,
             check: "status IN ('pending', 'sent', 'failed')"
           )

    create constraint(
             :notifications,
             :type_must_be_valid,
             check: "type IN ('email', 'sms', 'push', 'whatsapp')"
           )
  end
end
