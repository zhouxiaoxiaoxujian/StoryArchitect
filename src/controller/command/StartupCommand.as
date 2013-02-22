package controller.command
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartupCommand extends SimpleCommand
	{
		public function StartupCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			// Get the application instance from the note
			var app:StoryArchitect = StoryArchitect ( notification.getBody() );
			
			//Register the Proxys
			
			
			// Register the Mediators
		}
	}
}