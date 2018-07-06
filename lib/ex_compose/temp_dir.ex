defmodule ExCompose.TempDir do
	def generate_new(folder_header \\ "") do

		cwd = File.cwd!
		parent_tmp_dir = get_temp_dir()
		new_folder_name = case folder_header do
			nil -> gen_time()
			"" -> gen_time() <> "___" <> folder_header
		end

		# raise exception if error
		[cwd, parent_tmp_dir, new_folder_name]
		|> Path.join
		|> Path.expand
		|> File.mkdir_p!

		{:ok, parent_tmp_dir, new_folder_name}
	end

	def get_temp_dir do
		Application.get_env(:ex_compose, :tmp_dir) || "tmp/excompose"
	end

	def gen_time do
		{tz_offset, tz} =
			case Application.get_env(:ex_compose, :time_zone) do
				{a, b} -> {a, b}
				_ -> IO.puts "Bad Time_Zone. Please set config :ex_compose, :time_zone to something like {2, \"Europe/Norway\"}."
			end

		NaiveDateTime.utc_now()
		|> NaiveDateTime.add(tz_offset * 3600, :second) # GMT+8
		|> DateTime.from_naive("Etc/UTC") # https://hexdocs.pm/elixir/DateTime.html#from_naive/2
		|> elem(1)
		|> Map.merge(%{time_zone: tz, utc_offset: tz_offset * 3600})
		|> DateTime.to_iso8601
	end
end