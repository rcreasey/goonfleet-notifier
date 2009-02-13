package com.goonfleet.notifier.classes
{
	
	public class Notice
	{
		[Bindable]
		public var index:int;
		
		[Bindable]
		public var text:String;
		
		[Bindable]
		public var countdown:Boolean;

		[Bindable]
		public var poster:String;
		
		[Bindable]
		public var expires:Date;
		
		
		public function Notice(notice:Object = null)
		{
			if (notice) {
				text = notice.text;
				expires = parseDate(notice.expires);
				countdown = notice.countdown;
				poster = notice.poster;
			}
		}
		
		private function parseDate(dateString:Object):Date {			
			return new Date(Number(dateString) * 1000);
		}
		
	}
}