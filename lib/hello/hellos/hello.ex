defmodule Hello.Hello do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hellos" do
    field :mensaje, :string
    timestamps()
  end

  def changeset(hello, attrs) do
    hello
    |> cast(attrs, [:mensaje])
    |> validate_required([:mensaje])
  end
end
