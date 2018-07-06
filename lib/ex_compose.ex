defmodule ExCompose do
	require IEx
	@moduledoc """
	Documentation for Excompose.

	Template path and destination relative path should be relative to the project root.
	"""

	alias ExCompose.{TempDir,Packer,Composer,Pathfinder}

	def write_xlsx(mappings, :gsub, template_proj_path, dest_proj_path, options \\ %{}) when is_map(mappings) and is_binary(template_proj_path) and is_binary(dest_proj_path) do

		# generate working folder
		{:ok, tmp_proj_path, folder_name} = TempDir.generate_new(options[:tmp_dir_header])

		# unpack xlsx to working folder
		folder_proj_path = Pathfinder.join([:cwd, tmp_proj_path, folder_name])
		{:ok, _xlsx_datafiles} = Packer.unpack_xlsx(template_proj_path, folder_proj_path)

		# read SharedStrings file
		celldata_file = Pathfinder.join(folder_proj_path, "xl/sharedStrings.xml")
		{:ok, string_content} = File.read(celldata_file)

		# REPLACE!
		{:ok, new_string_content} = Composer.gsub(string_content, mappings, options[:delimiter] || {"{{", "}}"})

		# write SharedStrings file
		:ok = File.write(celldata_file, new_string_content)

		# repackage xlsx
		dest_path = Pathfinder.join(:cwd, dest_proj_path)
		
		{:ok, result_file} = Packer.pack_xlsx(folder_proj_path, dest_path, options)
		
		{:ok, List.to_string(result_file)}
	end
end
