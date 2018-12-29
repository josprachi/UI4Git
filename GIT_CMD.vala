public class GIT_CMD:GLib.Object{
public string RepoToCheck{
	get { print("here");return RepoToCheck; }
	set { RepoToCheck= value; }
}	
public static int main (string[] args) {
	 
	GIT_CMD cmd= new GIT_CMD();
	cmd.getStatus(args);
	/*
	try {
		string[] spawn_args = {"git", "status"};
		string[] spawn_env = Environ.get ();
		 
		string ls_stdout;
		string ls_stderr;
		int ls_status;
		print("Please enter path");
		
		string input = stdin.read_line();  
		//RepoToCheck=input;
		//print("%s=> RepoTocheck",RepoToCheck);
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
	} 
	catch (SpawnError e) {
		print ("Error: %s\n", e.message);
	}
*/
	return 0;
}

public void getStatus(string[] args)
{
	try {
		string[] spawn_args = {"git", "status"};
		string[] spawn_env = Environ.get ();
		 
		string ls_stdout;
		string ls_stderr;
		int ls_status;
		print("Please enter path");
		
		string input = stdin.read_line();  
		//RepoToCheck=input;
		//print("%s=> RepoTocheck",RepoToCheck);
		Process.spawn_sync (args[1],
							spawn_args,
							spawn_env,
							SpawnFlags.SEARCH_PATH,
							null,
							out ls_stdout,
							out ls_stderr,
							out ls_status);		
		print("input => %s spawn_env=> %s",input,Environment.get_current_dir());
		print (ls_stdout);
	} 
	catch (SpawnError e) {
		print ("Error: %s\n", e.message);
	}
}
}