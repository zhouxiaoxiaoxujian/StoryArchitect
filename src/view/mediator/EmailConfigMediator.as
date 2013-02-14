package view.mediator
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.EmailConfig;
	
	public class EmailConfigMediator extends Mediator
	{
		public static const NAME:String = "EmailConfigMediator";
		
		public function EmailConfigMediator(viewComponent:EmailConfig)
		{
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array
		{
			return [];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			
		}
	}
}