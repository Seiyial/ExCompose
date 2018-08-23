defmodule ExCompose.Packer do

	def unpack_xlsx(source, unpack_dir) do
		{:ok, _contents} =
			source
			|> String.to_charlist
			|> :zip.unzip(cwd: unpack_dir)
	end

	def pack_xlsx(src_dir, dest_proj_path, _options) do

		src_files_charlist =
			src_dir
			|> File.ls!
			|> Enum.map(&(String.to_charlist(&1)))

		src_dir_charlist = String.to_charlist(src_dir)
		dest_charlist = String.to_charlist(dest_proj_path)

		IO.inspect(src_dir_charlist, label: "src_dir_charlist")
		IO.inspect(src_files_charlist, label: "src_files_charlist")
		IO.inspect(dest_charlist, label: "dest_name relative to proj root")

		{:ok, _dest_file} = :zip.create(dest_charlist, src_files_charlist, cwd: src_dir_charlist)
	end
end