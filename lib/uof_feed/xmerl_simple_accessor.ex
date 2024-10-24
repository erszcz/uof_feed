defmodule UofFeed.XmerlSimpleAccessor do
  @behaviour DataSchema.DataAccessBehaviour

  @impl true
  def field({_, attrs, _} = _data, {:attr, attr}) do
    attrs[attr]
  end

  @impl true
  def list_of(data, path) do
    path.(data)
  end

  @impl true
  def has_one(data, path) do
    path.(data)
  end

  @impl true
  def has_many(data, path) do
    path.(data)
  end
end
