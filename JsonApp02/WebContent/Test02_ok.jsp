<%@page import="org.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	// JSON 라이브러리를 사용하는 경우
	JSONObject obj = new JSONObject(); //-- 빈 껍데기 json 객체 생성
	obj.put("name", name);			   //   각각의 값 채워넣음   
	obj.put("age", age);
	
	response.setContentType("text/xml; charset=UTF-8");
	response.getWriter().write(obj.toString());	
%>