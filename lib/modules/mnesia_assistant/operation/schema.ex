defmodule MnesiaAssistant.Schema do
  @moduledoc """

  """
  alias :mnesia, as: Mnesia

  # Schema
  @doc """

  """
  def schema(), do: Mnesia.schema()

  def schema(table), do: Mnesia.schema(table)

  @doc """

  """
  def create(nodes \\ [node()]) when is_list(nodes) do
    create_dir()
    Mnesia.create_schema([node()])
  end

  @doc """

  """
  def delete_schema(nodes \\ [node()]), do: Mnesia.delete_schema(nodes)

  # {name, Name}
  # | {max, [table()]}
  # | {min, [table()]}
  # | {allow_remote, boolean()}
  # | {ram_overrides_dump, boolean()}
  @doc """

  """
  def activate_checkpoint(args) when is_list(args), do: Mnesia.activate_checkpoint(args)

  # deactivate_checkpoint(Name :: term()) -> result()
  def deactivate_checkpoint(name), do: Mnesia.deactivate_checkpoint(name)

  defp create_dir() do
    path = Application.get_env(:mnesia, :dir)

    with true <- !is_nil(path), false <- File.dir?(path) do
      :ok = File.mkdir_p!(path)
    end
  end
end