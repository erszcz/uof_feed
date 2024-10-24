defmodule UofFeed.Model.Outcome do
  require DataSchema

  @fields [
    field: {:id, ~c"string(@id)", {__MODULE__, :cast_id, []}}
  ]

  @data_accessor UofFeed.XmerlSimpleAccessor
  DataSchema.data_schema @fields

  ## If we wanted to use `DataSchema.to_struct/5`, for example to integrate with Ecto,
  ## it'd be handy to have the fields accessible.
  def fields, do: @fields

  def cast_id({:xmlObj, :string, clist}), do: cast_id(clist)
  def cast_id(clist) when is_list(clist) do
    case :string.to_integer(clist) do
      {int, []} -> {:ok, int}
      {:error, :badarg} -> {:error, {:badarg, clist}}
      {_, leftover} -> {:error, {:leftover, leftover}}
    end
  end

  def test do
    o_simple = {:outcome, [ id: ~c"12", odds: ~c"4.25", probabilities: ~c"0.185077449", active: ~c"1" ], []}
    o = o_simple |> :xmerl_lib.normalize_element()
    DataSchema.to_struct(o, UofFeed.Model.Outcome)
  end
end
