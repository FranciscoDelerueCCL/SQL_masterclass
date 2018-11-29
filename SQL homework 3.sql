SELECT venuename,sum(numtickets)-sum(qtysold) as unsold_tickets
from sql_masterclass.listing
LEFT JOIN sql_masterclass.sales
ON listing.listid=sales.listid
left JOIN sql_masterclass.event
on sales.eventid=event.eventid
left join sql_masterclass.venue
on event.venueid=venue.venueid
where venue.venueid in (select DISTINCT venueid from sql_masterclass.venue where venuestate='OH')
group by venuename