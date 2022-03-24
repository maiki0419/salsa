import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    locale: 'ja',
    events: 'schedules.json',
    eventClick: (e)=>{// イベントのクリックイベント
		alert( e.event.title + '.\n' + e.event.start + '.\n' + e.event.end);
	}

  });

  calendar.render();
});