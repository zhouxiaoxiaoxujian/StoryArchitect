package model.VO
{
	public class EmailConfigVO
	{
		public function EmailConfigVO(host:String, port:Number, user:String, password:String)
		{
			this.host = host;
			this.port = port;
			this.user = user;
			this.password = password;
		}
		
		private var _host:String;
		
		private var _port:Number;
		
		private var _user:String;
		
		private var _password:String;

		public function get password():String
		{
			return _password;
		}

		public function set password(value:String):void
		{
			_password = value;
		}

		public function get user():String
		{
			return _user;
		}

		public function set user(value:String):void
		{
			_user = value;
		}

		public function get port():Number
		{
			return _port;
		}

		public function set port(value:Number):void
		{
			_port = value;
		}

		public function get host():String
		{
			return _host;
		}

		public function set host(value:String):void
		{
			_host = value;
		}

	}
}