defmodule DesafioMagaluWeb.SchedulerJSON do
  alias DesafioMagalu.Scheduler.{Notification}

  def show(%{notification: notification}) do
    %{
      data: status(notification)
    }
  end

  def delete(%{notification: notification}) do
    %{
      data: data_out(notification)
    }
  end

  defp status(%Notification{} = notification) do
    %{
      status: notification.status
    }
  end

  defp data_out(%Notification{} = notification) do
    %{
      id: notification.id,
      destination: notification.destination,
      send_at: notification.send_at,
      message: notification.message,
      status: notification.status,
      type: notification.type
    }
  end
end
