defmodule ElixirUrlShortenerCli do
  @moduledoc """
  A simple URL Shortener CLI.
  """

  @storage_file "urls.db"

  def main(args) do
    case args do
      ["shorten", url] -> shorten(url)
      ["expand", short] -> expand(short)
      _ -> IO.puts("Usage: shorten <url> | expand <short_url>")
    end
  end

  def shorten(url) when is_binary(url) do
    short = :crypto.hash(:sha256, url) |> Base.url_encode64(padding: false) |> String.slice(0, 8)

    mappings = load_mappings()
    mappings = Map.put(mappings, short, url)
    save_mappings(mappings)

    IO.puts("Short URL: #{short}")
    short
  end

  def expand(short) when is_binary(short) do
    mappings = load_mappings()

    case Map.get(mappings, short) do
      nil ->
        IO.puts("Not found")
        :error

      url ->
        IO.puts("Original URL: #{url}")
        url
    end
  end

  defp load_mappings do
    if File.exists?(@storage_file) do
      @storage_file |> File.read!() |> :erlang.binary_to_term()
    else
      %{}
    end
  end

  defp save_mappings(mappings) do
    File.write!(@storage_file, :erlang.term_to_binary(mappings))
  end
end
