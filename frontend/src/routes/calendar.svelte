<script lang="ts">
    import Calendar from '@event-calendar/core';
    import DayGrid from '@event-calendar/day-grid';
	import type { CalendarEvent } from './../types'
	import { onMount } from 'svelte'

	let events: CalendarEvent[] | any[] = []
	

    let plugins = [DayGrid];
	let options = {
        view: 'dayGridMonth',
		eventSources: [{events: async () => {
				const RawEvents = await fetch('http://localhost:8080/events/all')
				let unfEvents = await RawEvents.json()
				unfEvents = unfEvents.data
				events = []
				unfEvents.forEach((event: any) => {
					events.push({
						id: event.id,
						start: event.startDate,
						end: event.endDate,
						title: event.name
					})
				})
				return events
			}
		}]
    }

</script>

<Calendar {plugins} {options} />