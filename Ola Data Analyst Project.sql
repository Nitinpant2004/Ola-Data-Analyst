use ola_car_booking;
select* from booking;

# Retrieve all sucessful bookings.
create view successful_bookings as
select*from booking
where booking_status = "Success";
select*from successful_bookings;

# Find the average ride distance for each vehicle type. 
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS Avg_Distance
FROM booking
GROUP BY Vehicle_Type;
select*from  ride_distance_for_each_vehicle ;

# Get the total number of cancelled rides by customers.
create view canceled_ride_by_customers as
select count(*) from booking
where Booking_Status = "Canceled_Rides_by_Customer";
select*from canceled_ride_by_customer;

# List the top 5 customer who booked the highest number of rides.
CREATE VIEW top_5_Customer AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM booking
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;
select * from top_5_Customer;

# Find the maximum and minimum driver rating for Prime Sedan Bookings.
create view max_min_driver_rating as
select max(Driver_Ratings) as max_rating,
Min(Driver_Ratings) as min_rating
From  booking where Vehicle_Type = 'Prime Sedan';
select * from max_min_driver_rating;

# Retrieve all rides where payment was made using UPI. 
select * from booking 
where Payment_Method = "UPI";

# Find the average customer rating per vehicle type.
create view average_customer_rating_per_vehicle as
select Vehicle_Type , avg(Customer_Rating) as avg_customer_rating
from booking
group by
Vehicle_Type ;
select* from average_customer_rating_per_vehicle;

# Calculate the total booking value of rides completed sucessfully.
select sum(Booking_value) as total_Sucessful_Ride_value
from booking
where Booking_Status = 'Success' ;

# List all incomplete rides along with reason.
create view Incomplete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason
from booking
where Incomplete_Rides = 'Yes';
select * from Incomplete_Rides_Reason; 







