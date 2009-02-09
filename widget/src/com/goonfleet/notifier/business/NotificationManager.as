package com.goonfleet.notifier.business
{
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
		
	public class NotificationManager
	{
		
		[Bindable]
		public var eveTime:Date;
		
		[Bindable]
		public var ops:ArrayCollection;
		
		// --------------------------------------------
		public function storeNotification(notification:Object):void {
			var opSort:Sort = new Sort();
			opSort.fields = [new SortField("startTime")];
			
			eveTime = notification.eveTime;
			
			ops = notification.ops;
			ops.sort = opSort;
			ops.refresh(); // apply the sort
		}
		
	}
}