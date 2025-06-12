defmodule Hello.Hellos do
  alias Hello.Repo
  alias Hello.Hello

  def create_hello(attrs \\ %{}) do
    %Hello{}
    |> Hello.changeset(attrs)
    |> Repo.insert()
  end
end
