package com.goonfleet.notifier.events
{
	import flash.events.Event;

	public class NotificationEvent extends Event
	{
		public static const GET: String = "getNotificationEvent";
		
		public function NotificationEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}