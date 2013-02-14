package model.proxy
{
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;
	
	import model.VO.EmailConfigVO;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class EmailConfigProxy extends Proxy
	{
		public static const NAME:String = "EmailConfigProxy";
		
		private static const EMAIL_HOST:String = NAME + "/email/config/host";
		
		private static const EMAIL_PORT:String = NAME + "/email/config/port";
		
		private static const EMAIL_USER:String = NAME + "/email/config/user";
		
		private static const EMAIL_PASS:String = NAME + "/email/config/pass";
		
		public function EmailConfigProxy()
		{
			super(NAME);
		}
		
		public function get emailConfigVO():EmailConfigVO
		{
			return new EmailConfigVO(this.host, this.port, this.user, this.password);
		}
		
		public function set emailConfig(emailConfig:EmailConfigVO):void
		{
			this.host = emailConfig.host;
			this.port = emailConfig.port;
			this.user = emailConfig.user;
			this.password = emailConfig.password;
		}

		/**
		 * 设置email主机地址 
		 * @return 
		 * 
		 */		
		public function get host():String
		{
			return this.retrieve(EMAIL_HOST);
		}
		
		public function set host(host:String):void
		{
			this.store(EMAIL_HOST, host);
		}
		
		public function get port():Number
		{
			return Number(this.retrieve(EMAIL_PORT));
		}
		
		public function set port(port:Number):void
		{
			this.store(EMAIL_PORT, port.toString());
		}
		
		public function get user():String
		{
			return this.retrieve(EMAIL_USER);
		}
		
		public function set user(user:String):void
		{
			this.store(EMAIL_USER, user);
		}
		
		public function get password():String
		{
			return this.retrieve(EMAIL_PASS);
		}
		
		public function set password(pass:String):void
		{
			this.store(EMAIL_PASS, pass);
		}
		
		private function store(key:String, value:String):void
		{
			if ( key && value )
			{
				var bytes:ByteArray = new ByteArray();
				bytes.writeUTFBytes(value);
				EncryptedLocalStore.setItem(key, bytes);
			}
		}
		
		private function retrieve(key:String):String
		{
			var byteArray:ByteArray = EncryptedLocalStore.getItem(key);
			return byteArray != null : byteArray.readUTFBytes(byteArray.length) : null;
		}
	}
}