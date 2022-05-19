<%-- 
    Document   : orderpage
    Created on : 12 Mar, 2022, 10:47:30 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
        <style>
            table{
                margin-top: 50px;
                text-align: center;
                background: #333;
                color: #fff;
                }

            #show th, #show td{
                padding: 13px;
                }

            #btna td input{
                width: 100%;
                }
        </style>
    </head>
    <body>
        <center>
		<table border="4">
			<thead>
				<tr>
					<th>First Name</th>
					<td><input type="text" name="fname" id="fname"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Last Name</th>
					<td><input type="text" name="lname" id="lname"></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><input type="text" name="email" id="email"></td>
				</tr>
				<tr>
					<th>Age</th>
					<td><input type="text" name="age" id="age"></td>
				</tr>
				<tr id="btna">
					<td colspan="2"><input type="button" name="button" id="btn" value="Add" onclick="AddRow()"></td>
				</tr>
			</tbody>
		</table>

		<table border="4" id="show">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Age</th>
				</tr>
			</thead>
		</table>
	</center>
	
	<script>
		
		var list1 = [];
		var list2 = [];
		var list3 = [];
		var list4 = [];

		var n = 1;
		var x = 0;

		function AddRow(){

			var AddRown = document.getElementById('show');
			var NewRow = AddRown.insertRow(n);

			list1[x] = document.getElementById("fname").value;
			list2[x] = document.getElementById("lname").value;
			list3[x] = document.getElementById("email").value;
			list4[x] = document.getElementById("age").value;

			var cel1 = NewRow.insertCell(0);
			var cel2 = NewRow.insertCell(1);
			var cel3 = NewRow.insertCell(2);
			var cel4 = NewRow.insertCell(3);

			cel1.innerHTML = list1[x];
			cel2.innerHTML = list2[x];
			cel3.innerHTML = list3[x];
			cel4.innerHTML = list4[x];

			n++;
			x++;
		}

	</script>
    </body>
</html>
