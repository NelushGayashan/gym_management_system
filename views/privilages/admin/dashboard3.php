SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;


SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

SELECT column_name(s)
FROM table1
CROSS JOIN table2; 

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2; 

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2; 



<!DOCTYPE html>
<html>
<body>

<h1>HTML DOM Events</h1>
<h2>The onclick Event</h2>

<p>The onclick event triggers a function when an element is clicked on.</p>
<p>Click to trigger a function that will output "Hello World":</p>

<button onclick="myFunction()">Click me</button>

<p id="demo"></p>

<script>
function myFunction() {
  document.getElementById("demo").innerHTML = "Hello World";
}
</script>

</body>
</html>


<script>
function myFunction() {
  var a = document.getElementById("intime").value;
  var b = document.getElementById("outtime").value;
  if(b<=a){
  alert("Check intime & outtime again.\n Try again. ");
  document.getElementById("myBtn").disabled = true;
  document.getElementById("add").style.display='block';
  return false;
  }
}
</script>


<script>
    $(document).on("keypress", "input", function(e){
        if(e.which == 13){
             var a = document.getElementById("intime").value;
  var b = document.getElementById("outtime").value;
  if(b<=a){
  alert("Check intime & outtime again.\n Try again. ");
  document.getElementById("myBtn").disabled = true;
  document.getElementById("add").style.display='block';
  return false;
        }
    });</script>



<script>
var start = document.getElementById("start").value;
var end = document.getElementById("end").value;

document.getElementById("start").onchange = function() {diff(start,end)};
document.getElementById("end").onchange = function() {diff(start,end)};


function diff(start, end) {
    start = document.getElementById("start").value; //to update time value in each input bar
    end = document.getElementById("end").value; //to update time value in each input bar
    
    start = start.split(":");
    end = end.split(":");
    var startDate = new Date(0, 0, 0, start[0], start[1], 0);
    var endDate = new Date(0, 0, 0, end[0], end[1], 0);
    var diff = endDate.getTime() - startDate.getTime();
    var hours = Math.floor(diff / 1000 / 60 / 60);
    diff -= hours * 1000 * 60 * 60;
    var minutes = Math.floor(diff / 1000 / 60);

    return (hours < 9 ? "0" : "") + hours + ":" + (minutes < 9 ? "0" : "") + minutes;
}

setInterval(function(){document.getElementById("diff").value = diff(start, end);}, 1000); //to update time every second (1000 is 1 sec interval and function encasing original code you had down here is because setInterval only reads functions) You can change how fast the time updates by lowering the time interval
</script>





<script>
function myFunction() {
  var a = document.getElementById("intime").value;
  var b = document.getElementById("outtime").value;
  if(b<=a){
      document.getElementById("myBtn").disabled = true;
      document.getElementById("add").style.display='block';
  alert("Check intime & outtime again.\n Try again. ");
  
  document.getElementById("add").style.display='block';
  return false;
  }
}
</script>