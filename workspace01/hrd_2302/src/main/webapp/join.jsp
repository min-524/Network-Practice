<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<link href="style.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>Ȩ���� ȸ�� ���</b></h2>
			<form method="post" action="action.jsp" name="frm">
			<input type="hidden"  name="mode" value="insert">
			<table>
			<%
			request.setCharacterEncoding("UTF-8");
			Connection conn = null;
			Statement stmt = null;
			String custno = "";
			
			try {
				conn = Util.getConnection();	//��� ����
				stmt = conn.createStatement();	//sql �����ϱ� ���� ����
				String sql = "select max(custno)+1 as custno from tbl_member_202205";
				ResultSet rs = stmt.executeQuery(sql);	//stmt�� ���ؼ� sql ���� ���
				rs.next();	//1���� ����� ���, �ʱ��� Ŀ���� ù���� ����Ű�� �ʴ´�
				custno = rs.getString("custno");
				
			} catch(Exception e) {
				e.printStackTrace(); 
			}
			%>
		
			<tr>
			<tr>
				<td>ȸ����ȣ (�ڵ����) </td>
				<td><input type="text" name="custno" value="<%=custno %>" readonly></td>
			</tr>
			<tr>
				<td>ȸ������</td>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td>ȸ����ȭ</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>ȸ���ּ�</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>��������</td>
				<td><input type="text" name="joindate"></td>
			</tr>
			<tr>
				<td>����� [A:VIP, B:�Ϲ�, C:����]</td>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td>�����ڵ�</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="���" onclick="return joinCheck()">
				<input type="button" value="��ȸ" onclick="return search()">
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>