defmodule CinemaApi.Schemas.Showtime do
  @moduledoc """
  provides schema for the Movie Showtimes
  """
  import Ecto.Changeset
  use Ecto.Schema

  @primary_key {:id, :id, autogenerate: true}
  @foreign_key_type :id
  schema "showtimes" do
    field(:movie_id, :id)
    field(:title, :string)
    field(:imdb_id, :string)
    field(:showtime, :utc_datetime)
    field(:cinemahall, :string)

    timestamps()
  end

  def changeset(showtime, attrs) do
    showtime
    |> cast(attrs, [
      :title,
      :movie_id,
      :imdb_id,
      :showtime,
      :cinemahall
    ])
    |> unique_constraint(:movie_id, name: "mid-showtime-cinemahall-comp-key")
  end
end
