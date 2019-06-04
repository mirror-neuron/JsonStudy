<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test03.jsp</title>
<!-- json2.js 라이브러리 사용  -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript">

	var xmlHttp;
	
	function createXMLHttpRequest()
	{
		var xmlReq = false;
		
		if (window.XMLHttpRequest)
		{
			xmlReq = new XMLHttpRequest();
		}
		else if (window.ActiveXObject)
		{
			try
			{
				xmlReq = new ActiveXObject("Msxml2.XMLHTTP");
				
			} catch (e)
			{
				try
				{
					xmlReq = new ActiveXObject("Microsoft.XMLHTTP");	
				} 
				catch (e)
				{
					// XMLHttpRequest 객체를 생성할 수 없는 상태.
				}
			}
		}
		
		return xmlReq;
	}

	
	function startRequest()
	{
		xmlHttp = createXMLHttpRequest();
		// xmlHttp.onreadystatechange = handleStateChange();
		// onreadystatechange 자체가 기능하는 내용이기 때문에 함수형태로 지정하면 안 됨.
		xmlHttp.onreadystatechange = handleStateChange;
		
		var queryString = "";		
		
		queryString = "Test03_ok.jsp";
		
		xmlHttp.open("GET", queryString, true);
	
		xmlHttp.send("");
	}
	
	function handleStateChange()
	{
		if (xmlHttp.readyState == 4)
		{
			if (xmlHttp.status == 200)
			{
				// 업무 추출 → 콜백함수
				printData();
			}
		}
	}
	
	function printData()
	{
		var resValue = xmlHttp.responseText;
		
		// json.js 라이브러리를 사용하는 경우
		//var result = resValue.parseJSON();
		
		// json2.js 라이브러리를 사용하는 경우(json.js와 기능은 같지만 사용 방법이 다름)
		var result = JSON.parse(resValue);
		
		var output = document.getElementById("results");
		var outHtml = "";
		output.innerHTML = "";
		
		document.getElementById("results").style.display = ""; //-- 아래의 'none'을 지우겠다.
		
		outHtml = "<h2>count : " + result.count + "</h2>";
		
		for(var i=0; i<result.data.length; i++)
		{
			outHtml += "<h3>이름 : " + result.data[i].name + "</h3>";
			outHtml += "<h3>나이 : " + result.data[i].age + "</h3>";
		}
	
		output.innerHTML = outHtml;
		
	}
	
	
</script>

</head>
<body>

<div>
	<table>
		<tr>
			<td align="center">
				<input type="button" value="결과" style="width: 100px;" onclick="startRequest()" />
			</td>
		</tr>
	</table>
	
	
	
	
	<br><br>
	
	<div id="results" style="display: none;"></div>
	
</div>




</body>
</html>