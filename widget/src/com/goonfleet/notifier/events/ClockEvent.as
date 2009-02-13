package com.goonfleet.notifier.events
{
	import flash.events.Event;

	public class ClockEvent extends Event
	{
		public static const TICK: String = "tickEvent";
		
		public static const ROTATE_NOTICES: String = "rotateNoticesEvent";
		
		public function ClockEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}