<%@page import="org.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	/*
	방법①
	JSONObject ob = new JSONObject();
	ob.put("name", name);
	ob.put("age", age+"세");
	*/
	
	// ※ JSON 라이브러리를 사용하지 않는 경우
	//방법②
	StringBuffer ob = new StringBuffer("{");
	ob.append("\"name\":\"" + name + "\"");
	ob.append(",\"age\":\"" + age + "세\"");
	ob.append("}");
	
	/*
	"{'name':'홍길동','age':'23세'}"	
	*/
	
	out.println(ob.toString());
%>
