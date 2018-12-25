public static int main (string[] args) {
	try {
		string[] spawn_args = {"git", "status"};
		string[] spawn_env = Environ.get ();
		 
		string ls_stdout;
		string ls_stderr;
		int ls_status;
        print("Please enter path");
        string input = stdin.read_line();  

		Process.spawn_sync (args[1],
							spawn_args,
							spawn_env,
							SpawnFlags.SEARCH_PATH,
							null,
							out ls_stdout,
							out ls_stderr,
							out ls_status);

		
		print("input => %s",input);
		print (ls_stdout);
		

	} catch (SpawnError e) {
		print ("Error: %s\n", e.message);
	}
	return 0;
}
