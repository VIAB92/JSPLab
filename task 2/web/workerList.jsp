<%@page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>
<%@ page import="package1.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WorkerList</title>
<script>
	function checkForm()
	{
		if (document.getElementById('WorkerId').value=="")
			{
				alert("Enter value!");
				return false;
			}
		return true;
	}
</script>
</head>
<body>
	<form action='workerList.jsp' method='get' onsubmit='return checkForm()'>
		<p><input type='text' id='WorkerId' name='WorkerId'/><input type='submit'/></p>
	</form>
	<%
	if (request.getParameter("WorkerId") !=null)
	{	
		WorkerManager wm = new WorkerManager();
		wm.connectDB();
		Worker wk = wm.getWorkerById(Integer.parseInt(request.getParameter("WorkerId")));
		
		%>
                <table align='center' border="1">
			<tr>
				<th>ID</th>
				<th>FirstName</th>
				<th>LastName</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Salary</th>
			</tr>
			<tr>
				<td align='center'><%= wk.getWorkerID() %></td>
				<td align='center'><%= wk.getFirstName() %></td>
				<td align='center'><%= wk.getLastName() %></td>
				<td align='center'><%= wk.getPhone() %></td>
				<td align='center'><%= wk.getEmail() %></td>
				<td align='center'><%= wk.getSalary() %></td>
			</tr>
		</table>
		<%
                
               
	}
	%>
</body>
</html>