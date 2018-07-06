defmodule ExCompose.Composer do
	def gsub(string, %{} = mappings, {pre, post} = delimiters) when is_binary(string) do
		result =
			mappings
			|> Enum.reduce(string, fn({replacer, replacement}, acc) ->
					String.replace(acc, pre <> replacer <> post, replacement)
				end)
			|> IO.inspect(label: "ENUM REDUCE")
		{:ok, result}
	end
end