defmodule ExCompose.Composer do
	def gsub(string, %{} = mappings, {pre, post} = _delimiters) when is_binary(string) do
		result =
			mappings
			|> Enum.reduce(string, fn({replacer, replacement}, acc) ->
					String.replace(acc, pre <> replacer <> post, replacement)
				end)
			|> IO.inspect(label: "ENUM REDUCE")
		{:ok, result}
	end

	def insert_escapes(mappings) when is_map(mappings) do
		result_map =
			mappings
			|> Enum.map(fn {k, v} -> 
					{k, insert_escapes(v)}
				end)
			|> Map.new

		{:ok, result_map}
	end

	def insert_escapes(string) when is_binary(string) do
		string
		|> String.replace("&", "&amp;")
		# insert more escape replacers here
	end
end