<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
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
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>������ ���</h1>
		<form name="frm">
			<table border="1">
				<tr>
					<td>�����ڵ�</td>
					<td>�����</td>
					<td>����</td>
					<td>��簭��</td>
					<td>����</td>
					<td>���۽ð�</td>
					<td>����ð�</td>
					<td>����</td>
				</tr>
				<%
					request.setCharacterEncoding("UTF-8");
					try{
						Connection con = Util.getConnection();
						String sql=
								"SELECT id, co.name sname, credit, le.name as lname, week, start_hour, end_hour from course_tbl co, lecturer_tbl le where co.lecturer = le.idx ORDER by id";
						PreparedStatement pstmt = con.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						while(rs.next()){
							String week = rs.getString(5);
							switch(week){
							case"1":
								week = "������";
								break;
							case"2":
								week = "ȭ����";
								break;
							case"3":
								week = "������";
								break;
							case"4":
								week = "�����";
								break;
							case"5":
								week = "�ݿ���";
								break;
							}
							String start_hour = rs.getString(6);
							while(start_hour.length()<4){
								start_hour = "0" + start_hour;
							}
							String start = start_hour.substring(0,2) + "��" + start_hour.substring(2, 4) + "��";
							String end_hour = rs.getString(7);
							while(end_hour.length()<4){
								end_hour = "0" + end_hour;
							}
							String end = end_hour.substring(0,2) + "��" + end_hour.substring(2,4) + "��";
							%>
							<tr>
							<td>
							<a href="modify.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1) %></a>
							</td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=week %></td>
							<td><%=start %></td>
							<td><%=end %></td>
							<td><a href="action.jsp?id=<%=rs.getString(1) %>&mode=delete">����</a></td>
							</tr>
						<%
							}
						} 
						catch (Exception e) {
						e.printStackTrace();
					}
					%>
			</table>		
		</form>	
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>