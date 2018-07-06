defmodule ExCompose.Pathfinder do
	def join(paths) when is_list(paths) do
		paths
		|> Enum.map(fn x ->
				case x do
					:cwd -> File.cwd!
					other -> other
				end
			end)
		|> Path.join
		|> Path.expand
	end

	def join(path1, path2, path3 \\ ".", path4 \\ ".", path5 \\ ".") do
		join([path1, path2, path3, path4, path5])
	end
end