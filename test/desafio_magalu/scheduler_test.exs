defmodule DesafioMagalu.SchedulerTest do
  use DesafioMagaluWeb.ConnCase, async: true

  describe "scheduler" do
    @valid_attrs %{
      "destination" => "dona zefa",
      "message" => "hello",
      "send_at" => DateTime.utc_now(),
      "type" => "email"
    }

    test "POST /notifications", %{conn: conn} do
      conn = post(conn, ~p"/api/notifications", %{"notification" => @valid_attrs})

      resp = json_response(conn, 201)

      assert %{
               "data" => %{
                 "destination" => "dona zefa",
                 "message" => "hello",
                 "type" => "email",
                 "status" => "pending",
                 "send_at" => _send_at,
                 "id" => _id
               }
             } = resp
    end
  end
end
