<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="style.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>list</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<h2><b>ȸ�����/��ȸ/����</b></h2><br>
		<form>
		<table border=1>
			<tr>
				<td>ȸ����ȣ</td>
				<td>ȸ������</td>
				<td>��ȭ��ȣ</td>
				<td>�ּ�</td>
				<td>��������</td>
				<td>�����</td>
				<td>��������</td>
			</tr>
			<%
				request.setCharacterEncoding("UTF-8");
				Connection conn = null;
				Statement stmt = null;
				String grade = "";
				try{
					conn = Util.getConnection();
					stmt = conn.createStatement();
					String sql = "select * from tbl_member_202205 order by custno";
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()){
						grade = rs.getString("grade");
						switch(grade){
						case "A":
							grade = "VIP";
							break;
						case "B": 
							grade = "�Ϲ�";
							break;
						case "C" : 
							grade = "����";
							break;
						}
					%>
					<tr>
						<td> <a href="modify.jsp?custno=<%=rs.getString("custno") %>">
						<%=rs.getString("custno") %> </a> </td>
						<td><%=rs.getString("custname") %> </td>
						<td><%=rs.getString("phone") %> </td>
						<td><%=rs.getString("address") %> </td>
						<td><%=rs.getString("joindate") %> </td>
						<td><%=grade %> </td>
						<td><%=rs.getString("city") %> </td>
					</tr>
			<%
				}
			} catch(Exception e){
				e.printStackTrace();
			}
			%>				
		</table>
		</form>
	</section>
</body>
</html>