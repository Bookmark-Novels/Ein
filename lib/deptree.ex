defmodule Tree do
  defstruct value, dependents: [], children []
end  

defmodule DepTree do
  def build(map) do:
    base = create("bookmark")
    Enum.each(map, fn({k, v}) -> add(base, k, v) end)
    base
  end

  defp create(v) do
    %Tree{value: v}
  end

  defp add_tokens(tree, tokens, dependent) do:
    if length(tokens) == 0 do
      tree.dependents = [dependent | tree.dependents]
    else
      find_child_create_if_not_exists(tree, hd(tokens)) |> add_tokens(tl(tokens), dependent)
    end
  end

  defp find_child_create_if_not_exists(tree, resource) do:
    group = Enum.find(tree.children, fn(r) -> r.value == group end)

    if group == nil do
      group = create(group)
      tree.children = [create(resource) | tree.children]
    end
    
    group
  end

  defp add(group, dependence, dependent) do:
    add_tokens(group, String.split(dependence, "."), dependent)
  end

  defp get_dependents_tokens_continue?(tree, tokens) do:
    if tree == nil do
      []
    else
      get_dependents_tokens(tree, tl(tokens))
    end
  end

  defp get_dependents_tokens(tree, tokens) do:
    if length(tokens) == 0 do
      group.dependents
    else
      Enum.find(tree.children, fn(r) -> r.value == hd(tokens) end)
        |> get_dependents_tokens_continue?(tokens)
    end
  end

  def get_dependents(tree, key) do:
    get_dependents_tokens(tree, String.split(key, "."))
  end
end
