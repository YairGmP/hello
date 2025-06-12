defmodule Hello.Repo.Migrations.CreateHellos do
  use Ecto.Migration

  def change do
    create table(:hellos) do
      add :mensaje, :string

      timestamps(type: :utc_datetime)
    end
  end
end
