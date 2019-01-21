import numpy as np
import math

'''Problem 1. Revenue models.
Average monthly revenue at each store in the TableFarm salad chain is $100,000, with a standard deviation of $12,000. 
An advertising firm claims they can increase monthly revenue to $120,000,
but the standard deviation will be increased as well, to $25,000.

Write Python code to generate three lists of random numbers which model potential revenue: 
one list with 12 months of revenue using the current mean and standard deviation, 
another list with 12 months of revenue using the predicted mean and standard deviation, 
and a third list containing the revenue of all 24 months. 
Print your third list. You can assume a normal distribution. 
Round each number to the nearest $1,000.
'''
ave = 100000
sd = 12000

predicted_ave = 120000
predicted_sd = 25000
norm = list(np.round((np.random.normal(ave, sd, 12)), -3)) + list(np.round((np.random.normal(predicted_ave, predicted_sd, 12)), -3))
print(norm)

'''Problem 2(a). Bus arrival times.
Shuttle buses arrive at an airport to fetch passengers with an average interval of 15 minutes. 
Their actual interarrival times follow an exponential distribution. Use the random module to generate a list of 50 different bus intervals, 
rounded to the nearest tenth of a minute. For example, your list might begin [11.2, 34.1, 18.8, 23.5, ...]. Print your list.
Use Python to answer the following questions: What is the shortest waiting time in your list? What is the longest waiting time?
'''

exp = list(np.round(np.random.exponential(15, 50), 1))
print(exp)
print(min(exp))
print(max(exp))

'''Problem 2(b). Cumulative waiting times.
Suppose the first bus arrives at the measured number of minutes after midnight. 
The bus company wants to track the time each bus arrived, measured in minutes after midnight. 
Make a list of the number of minutes after midnight that each bus arrived at, using the list you generated in part (a). 
With our example in part (a), for instance, the answer would start [11.2, 45.3, 64.1, 87.6, ...]. Print the list.
Using the list generated in 2(a), at what time does the 50th bus arrive? 
Print the time in the format HH:MM AM/PM where HH is the hour and MM is the minute. 
(Note that HH should be between 01 and 12.) [Do not generate a new list; make sure to use the list of intervals already generated in 2(a).]
'''
print(sum(exp)/60)
hr = math.floor(sum(exp)/60)
minutes = int((sum(exp)/60-hr)*60)
form = ' PM'
if hr > 12:
	hr = hr - 12
elif hr < 12:
	form = ' AM'
if minutes < 10:
	minutes = '0' + str(minutes)
if hr < 10:
	hr = '0' + str(hr)
print(hr, ':', minutes, form, sep='')


'''Problem 3(a). Chocolate and the Nobel.
Researchers have observed a (presumably spurious) correlation between per capita chocolate consumption and the rate of Nobel prize laureates: 
see Chocolate Consumption, Cognitive Function, and Nobel Laureates. In this problem, we will create some sample data to simulate this relationship.
Write Python code to produce a list of 50 ordered pairs (c,n), where c represents chocolate consumption in kg/year/person and 
n represents the number of Nobel laureates per 10 million population. 
The values for c should be random numbers (not necessarily integers!) between 0 and 15. 
You may assume that c and n are related by n=0.4⋅c−0.8.
However, it is not possible for a nation to have a negative number of Nobel laureates, so if your predicted value of n is less than 0, 
replace that value by 0. Report your values of c and n to 2 decimal places. Print your list of ordered pairs.
'''

'''Problem 3(b). Error term.
Our list of data from part (a) is not a good simulation of real-world data, because it is perfectly linear.
Starting with the c and n values you generated in part (a), generate new ne values, using the following formula: ne=n+ϵ.
Here ϵ should be a random variable with normal distribution, mean 0, and standard deviation 1.
Using the list of ordered pairs generated in 3(a), create a new list of 50 ordered pairs (c,ne).
Again, your simulated data should not predict negative numbers of Nobel laureates. Again, do not generate a new list; 
make sure to use the list of ordered pairs already generated in 3(a).
Print your new list of ordered pairs.'''

l1 = []
l2 = []
l3 = []
for i in range(50):
	c = np.round(np.random.uniform(0,15),2)
	ϵ = np.random.normal(0, 1)
	n = np.round(0.4*c-0.8,2)
	ne = np.round(n + ϵ,2)
	if n < 0:
		n = 0
	if ne < 0:
		ne = 0

	l1.append((c, n))
	l2.append((c, ne))


print(l1)
print(l2)

'''Problem 3(c). Winners and losers.
Make a new list consisting of all of the ordered pairs from your list from part (b) such that ne>0.4⋅c−0.8.
Print this new (shorter) list. Use Python to calculate how many items are in your list of winners.
'''
l3 = []
for (c, ne) in l2:
	if ne>0.4*c-0.8:
		l3.append((c, ne))
print(l3)
print(len(l3))


'''Problem 3(d). Preparing for R.
For future use, split your list of ordered pairs from Problem 3(b) (not 3(c)!) into two lists.
The first list should contain the c values, and the second list should contain the ne values.
'''
l_c = []
l_ne = []
for (c, ne) in l2:
	l_c.append(c)
	l_ne.append(ne)

print(l_c)
print(l_ne)

