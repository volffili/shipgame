extends Node

var day : int
var month : int
var year : int

signal date_change

func _ready():
	self.set_date(1,1,1570)
	emit_signal("date_change",get_date_as_string())

func set_date(d,m,y):
	if (d < 1 || m < 1 || y < 1):
		assert(false); #INVALID DATE
	day = d
	month = m
	year = y
	_transfer_days_to_months()
	_transfer_months_to_years()

func get_date_as_string():
	return str(day)+"."+str(month)+"."+str(year);

func next_day():
	day += 1;
	_transfer_days_to_months()
	emit_signal("date_change",get_date_as_string())

func next_month():	
	month += 1
	_transfer_months_to_years()
	emit_signal("date_change",get_date_as_string())

func _transfer_days_to_months():
	while (day > _days_in_month()):
		day -= _days_in_month()
		next_month()

func _transfer_months_to_years():
	while(month > 12):
		month -= 12
		year += 1

func _days_in_month():
	match(month):
		2: return 28 + int(year%4 == 0)
		4,6,9,11: return 30
		_: return 31

