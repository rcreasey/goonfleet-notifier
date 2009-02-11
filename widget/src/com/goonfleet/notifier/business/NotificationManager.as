package com.goonfleet.notifier.business
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
		
	public class NotificationManager
	{
		
		private var ticker:Timer = null;
		
		[Bindable]
		public var eveTime:Date;
		
		[Bindable]
		public var ops:ArrayCollection;
		
		
		public function storeNotification(notification:Object):void {
			var opSort:Sort = new Sort();
			opSort.fields = [new SortField("startTime")];
			
			eveTime = notification.eveTime;
			startClock();
			
			ops = notification.ops;
			ops.sort = opSort;
			ops.refresh(); // apply the sort
		}
		
		public function startClock():void {
			ticker = new Timer(1000);
			ticker.addEventListener(TimerEvent.TIMER, updateClock);
			ticker.start();
		}
		
		public function updateClock(event:TimerEvent):void {
			eveTime = new Date(eveTime.time + 1000);
		}
	}
}