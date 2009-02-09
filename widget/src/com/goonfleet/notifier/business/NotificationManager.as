package com.goonfleet.notifier.business
{
	import mx.collections.ArrayCollection;
		
	public class NotificationManager
	{
		
		[Bindable]
		public var eveTime:Date;
		
		[Bindable]
		public var ops:ArrayCollection;
		
		// --------------------------------------------
		public function storeNotification(notification:Object):void {
			eveTime = notification.eveTime;
		}
		
	}
}