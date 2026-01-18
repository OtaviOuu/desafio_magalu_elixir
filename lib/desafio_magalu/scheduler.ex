defmodule DesafioMagalu.Scheduler do
  alias ElixirLS.LanguageServer.Providers.Completion.Reducers.Struct
  alias DesafioMagalu.Repo
  alias DesafioMagalu.Scheduler.Notification

  def get_notification_by_id(id) do
    with {:ok, uuid} <- Ecto.UUID.cast(id) do
      Notification
      |> Repo.get_by(id: uuid)
    end
  end

  def delete_notification(notification_id) do
    with %Notification{} = notification <- get_notification_by_id(notification_id) do
      Repo.delete(notification)
    end
  end

  def create_notification(notification_attrs) do
    notification_attrs
    |> Notification.changeset()
    |> Repo.insert()
  end
end
