defmodule DesafioMagaluWeb.SchedulerController do
  use DesafioMagaluWeb, :controller

  alias DesafioMagalu.Scheduler
  alias DesafioMagalu.Scheduler.Notification

  action_fallback DesafioMagaluWeb.FallbackController

  def create(conn, %{"notification" => notification_attrs}) do
    case Scheduler.create_notification(notification_attrs) do
      {:ok, notification} ->
        conn
        |> put_status(:created)
        |> render("show.json", notification: notification)

      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, changeset}
    end
  end

  def delete(conn, %{"id" => notification_id}) do
    case Scheduler.delete_notification(notification_id) do
      {:ok, notification} ->
        conn
        |> put_status(:ok)
        |> render(notification: notification)

      _ ->
        {:error, :not_found}
    end
  end

  def show(conn, %{"id" => notification_id}) do
    case Scheduler.get_notification_by_id(notification_id) do
      %Notification{} = notification ->
        render(conn, notification: notification)

      _ ->
        {:error, :not_found}
    end
  end
end
