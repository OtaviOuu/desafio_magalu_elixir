defmodule DesafioMagalu.AvaliacoesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DesafioMagalu.Avaliacoes` context.
  """

  @doc """
  Generate a avaliacao.
  """
  def avaliacao_fixture(attrs \\ %{}) do
    {:ok, avaliacao} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> DesafioMagalu.Avaliacoes.create_avaliacao()

    avaliacao
  end
end
