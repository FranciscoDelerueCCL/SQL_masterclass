select firstname,lastname,SUBSTRING(firstname from 1 for 1) || ' ' || SUBSTRING(lastname from 1 for 1) as initials
from sql_masterclass.users
limit 10