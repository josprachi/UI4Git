public class GIT_CMD:GLib.Object{
public string RepoToCheck{
	get; //{ print("here");return RepoToCheck; }
	set;//{ RepoToCheck= value; }
}	
public static int main (string[] args) {
	 
	GIT_CMD cmd= new GIT_CMD();
	cmd.init();
	cmd.doOperation("checkLog");
	return 0;
}
public void init()
{
	print("Please enter path");
		
	string input = stdin.read_line();  
	openRepository(input);

}
public void openRepository(string _strRepository)
{
	this.RepoToCheck=_strRepository;
}
public void doOperation(string operation)
{ string[] spawn_args;
  string[] operation_Env=Environ.get();
  /* string ls_stdout;
  string ls_stderr;
  int ls_status;*/
	switch (operation) 
	{
	case "checkStatus":
	spawn_args = getStatus();	
		break;
	case "checkLog":
	spawn_args = showLog();
	break;		
	default:
	spawn_args=getHelp();
		break;
	}
	runCommand(spawn_args,operation_Env);
}
public void runCommand(string[] spawn_args, string[] operation_Env)
{
	try {	
		string ls_stdout;
		string ls_stderr;
		int ls_status;
		Process.spawn_sync (this.RepoToCheck,
							spawn_args,
							operation_Env,
							SpawnFlags.SEARCH_PATH,
							null,
							out ls_stdout,
							out ls_stderr,
							out ls_status);	
		print (ls_stdout);
	} 
	catch (SpawnError e) {
		print ("Error: %s\n", e.message);
	}
}
public string[] getHelp()
{
	return {"git","--help"};
}
public string[] getStatus()
{
	return {"git","status"};
}
public string[] showLog()
{
	return {"git","log"};
}
}