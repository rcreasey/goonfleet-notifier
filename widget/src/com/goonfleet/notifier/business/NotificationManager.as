package com.goonfleet.notifier.business
{
	import com.goonfleet.notifier.classes.Notice;
	import com.goonfleet.notifier.events.ClockEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.core.Application;
		
	public class NotificationManager
	{
		
		private var ticker:Timer = null;
		
		private var noticeTicker:Timer = null;
		
		[Bindable]
		public var eveTime:Date;
		
		[Bindable]
		public var ops:ArrayCollection;
		
		[Bindable]
		public var notices:ArrayCollection;
		
		[Bindable]
		public var currentNotice:Notice = new Notice;
		
		
		public function storeNotification(notification:Object):void {
			var opSort:Sort = new Sort();
			opSort.fields = [new SortField("startTime")];
			
			ops = notification.ops;
			ops.sort = opSort;
			ops.refresh(); // apply the sort
			
			notices = notification.notices;
			
			if (notices.length > 0) {
				currentNotice.text = notices[0].text;
				currentNotice.expires = notices[0].expires;
				currentNotice.countdown = notices[0].countdown;
				currentNotice.poster = notices[0].poster;
				currentNotice.index = 0;
			}
			
			eveTime = notification.eveTime;
			startClock();
		}
		
		public function startClock():void {
			ticker = new Timer(1000);
			ticker.addEventListener(TimerEvent.TIMER, updateClock);
			ticker.start();
			
			if (notices.length > 0) {		
				noticeTicker = new Timer(5000);
				noticeTicker.addEventListener(TimerEvent.TIMER, rotateNotices);
				noticeTicker.start();
			}
		}
		
		public function updateClock(event:TimerEvent):void {
			eveTime = new Date(eveTime.time + 1000);
			
			var clockEvent:ClockEvent = new ClockEvent(ClockEvent.TICK);
			Application.application.dispatchEvent(clockEvent);
		}
		
		public function rotateNotices(event:TimerEvent):void {	
			if (currentNotice.index >= (notices.length -1)) {
				currentNotice.index = 0;
			} else {
				currentNotice.index++;
			}

			currentNotice.text = notices[currentNotice.index].text;
			currentNotice.expires = notices[currentNotice.index].expires;
			currentNotice.countdown = notices[currentNotice.index].countdown;
			currentNotice.poster = notices[currentNotice.index].poster;
		}
	}
}