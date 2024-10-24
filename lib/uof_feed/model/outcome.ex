defmodule UofFeed.Model.Outcome do
  require DataSchema

  #{:outcome, [ id: ~c"12s", odds: ~c"4.25", probabilities: ~c"0.185077449", active: ~c"1" ], []}

  @fields [
    field: {:id, {:attr, :id}, {__MODULE__, :charlist_to_integer, []}}
  ]

  @data_accessor UofFeed.XmerlSimpleAccessor
  DataSchema.data_schema @fields

  def fields, do: @fields

  def charlist_to_integer(clist) do
    case :string.to_integer(clist) do
      {int, []} -> {:ok, int}
      {_, leftover} -> {:error, {:leftover, leftover}}
    end
  end
end
