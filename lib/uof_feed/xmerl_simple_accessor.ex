defmodule UofFeed.XmerlSimpleAccessor do
  @behaviour DataSchema.DataAccessBehaviour

  @impl true
  def field(element = _data, xpath) do
    :xmerl_xpath.string(xpath, element)
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
