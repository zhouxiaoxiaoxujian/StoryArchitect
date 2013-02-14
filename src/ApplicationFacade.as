package
{
	import controller.command.StartupCommand;
	import controller.constrant.AppConstrants;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade
	{
		public function ApplicationFacade()
		{
			super();
		}
		
		public static function getInstance():ApplicationFacade
		{
			if(instance == null) instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			this.registerCommand(AppConstrants.STARTUP,StartupCommand);
		}
		
		public function startup(app:StoryArchitect):void
		{
			this.sendNotification(AppConstrants.STARTUP, app);
		}
	}
}