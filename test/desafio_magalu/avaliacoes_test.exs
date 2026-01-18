defmodule DesafioMagalu.AvaliacoesTest do
  use DesafioMagalu.DataCase

  alias DesafioMagalu.Avaliacoes

  describe "disciplinas" do
    alias DesafioMagalu.Avaliacoes.Avaliacao

    import DesafioMagalu.AvaliacoesFixtures

    @invalid_attrs %{name: nil}

    test "list_disciplinas/0 returns all disciplinas" do
      avaliacao = avaliacao_fixture()
      assert Avaliacoes.list_disciplinas() == [avaliacao]
    end

    test "get_avaliacao!/1 returns the avaliacao with given id" do
      avaliacao = avaliacao_fixture()
      assert Avaliacoes.get_avaliacao!(avaliacao.id) == avaliacao
    end

    test "create_avaliacao/1 with valid data creates a avaliacao" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Avaliacao{} = avaliacao} = Avaliacoes.create_avaliacao(valid_attrs)
      assert avaliacao.name == "some name"
    end

    test "create_avaliacao/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Avaliacoes.create_avaliacao(@invalid_attrs)
    end

    test "update_avaliacao/2 with valid data updates the avaliacao" do
      avaliacao = avaliacao_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Avaliacao{} = avaliacao} = Avaliacoes.update_avaliacao(avaliacao, update_attrs)
      assert avaliacao.name == "some updated name"
    end

    test "update_avaliacao/2 with invalid data returns error changeset" do
      avaliacao = avaliacao_fixture()
      assert {:error, %Ecto.Changeset{}} = Avaliacoes.update_avaliacao(avaliacao, @invalid_attrs)
      assert avaliacao == Avaliacoes.get_avaliacao!(avaliacao.id)
    end

    test "delete_avaliacao/1 deletes the avaliacao" do
      avaliacao = avaliacao_fixture()
      assert {:ok, %Avaliacao{}} = Avaliacoes.delete_avaliacao(avaliacao)
      assert_raise Ecto.NoResultsError, fn -> Avaliacoes.get_avaliacao!(avaliacao.id) end
    end

    test "change_avaliacao/1 returns a avaliacao changeset" do
      avaliacao = avaliacao_fixture()
      assert %Ecto.Changeset{} = Avaliacoes.change_avaliacao(avaliacao)
    end
  end
end
