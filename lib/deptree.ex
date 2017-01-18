defmodule Tree do
  defstruct value, dependents: [], children %{}
end  

defmodule DepTree do
  def build(map) when is_map(map) do:
    base = create("bookmark")
    for {k, v} <- map, do: base = add(base, k, v)
    base
  end

  defp create(v) do
    %Tree{value: v}
  end

  defp add_dep(%Tree{value: value, dependents: dependents, children: children}, [], dependent) do:
    %Tree{value: value, dependents: [dependent | dependents], children: children}
  end

  defp add_dep(%Tree{value: value, dependents: dependents, children: children}, tokens, dependent) do:
    updated_child = Map.get(children, hd(tokens)) |> add_dep(tl(tokens), dependent)
    %Tree{value: value, dependents: dependents, children: %{children | hd(tokens) => updated_child}}
  end

  defp path_tokens(%Tree{value: value, dependents: dependents, children: children}, []) do:
    %Tree{value: value, dependents: dependents, children: children}
  end

  # Follows a list of tokens in the dependency tree
  # and creates new nodes if not available.
  #
  # @returns A Tree struct with the token path created as children/children of children.
  defp path_tokens(%Tree{value: value, dependents: dependents, children: children}, tokens) do:
    lazy = &(create(hd(tokens)))
    child = Map.get(children, hd(tokens), lazy) |> path_tokens(tl(tokens))
    %{Tree(value: value, dependents: dependents, children: %{children | hd(tokens) => child})
  end

  defp add(%Tree{value: value, dependents: dependents, children: children}, dependence, dependent) do:
    tokens = String.split(dependence, ".")
    path = path_tokens(%Tree{value: value, dependents: dependents, children: children}, tokens)
    add_dep(path, tokens, dependent)
  end

  defp get_dependents_tokens_continue?(nil, tokens) do:
    []
  end

  defp get_dependents_tokens_continue?(tree, tokens) do:
    get_dependents_tokens(tree, tl(tokens))
  end

  defp get_dependents_tokens(tree, []) do:
    tree.dependents
  end

  defp get_dependents_tokens(tree, tokens) do:
    Map.get(children, hd(tokens)) |> get_dependents_tokens_continue?(tokens)
  end

  def get_dependents(tree, key) when is_bitstring(key) do:
    get_dependents_tokens(tree, String.split(key, "."))
  end
end
