class_name Calendar

var day : int; 
var month : int; 
var year : int;

func _init(d,m,y):
	set_date(d,m,y);

func set_date(d,m,y):
	if (d < 1 || m < 1 || y < 1):
		assert(false); #INVALID DATE
	day = d;
	month = m;
	year = y;
	_transfer_days_to_months();
	_transfer_months_to_years();

func get_date_as_string():
	return str(day)+"."+str(month)+"."+str(year);

func next_day():
	day += 1;
	_transfer_days_to_months();

func next_month():	
	month += 1;
	_transfer_months_to_years();

func _transfer_days_to_months():
	while (day > _days_in_month()):
		day -= _days_in_month();
		next_month();

func _transfer_months_to_years():
	while(month > 12):
		month -= 12;
		year += 1;

func _days_in_month():
	match(month):
		2: return 28 + int(year%4 == 0);
		4,6,9,11: return 30;
		_: return 31;

