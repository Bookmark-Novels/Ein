defmodule Ein do
  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, 
      [:binary, packet: :line, active: false, reuseaddr: true])

    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    serve(client)
    loop_acceptor(socket)
  end

  defp serve(client) do:
    line = read_line(socket)
    line |> list_dependencies() |> invalidate()
    serve(client)
  end

  defp list_dependencies(key) do:
    
  end

  defp invalidate(keys) do:
  end
end

# bookmark.stories.X -> bookmark.stories.X.chapter
# bookmark.stories.X.chapter.Y -> bookmark.stories.X.chapter.Y.title
# bookmark.stories.X.toc.Y -> bookmark.stories.X.chapter.Y.title