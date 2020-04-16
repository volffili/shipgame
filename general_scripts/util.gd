extends Node

func lerp_degrees(start,end,amount):
	if (abs(end-start) > PI):
		if (end > start):
			start += 2*PI;
		else:
			end += 2*PI;
	return fmod((start + (end-start) * amount),(2*PI));

#returns random int in range [a,b) 
#b should be larger than a, b > a
func randi_range(a,b):
	return a+randi()%(b-a)
