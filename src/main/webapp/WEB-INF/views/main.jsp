<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Ư�� �� �ŷ����� ��ȸ ����</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var str1 = ""; // div Api1 ���ڿ�
var str2 = ""; // div Api2 ���ڿ�
var str3 = ""; // div Api3 ���ڿ�
var str4 = ""; // div Api4 ���ڿ�

/**
 * @description �·ε�� �ʱ�ȭ
 */
function fnInit() {
	fnDiv1();
	str1 +="</table>";
	$("#tableList1").html(str1);

	fnDiv2();
	str2 +="</table>";
	$("#tableList2").html(str2);

	fnDiv3();
	str3 +="</table>";
	$("#tableList3").html(str3);

	fnDiv4();
	str4 +="</table>";
	$("#tableList4").html(str4);
}

/**
 * @description div Api1 ���� ����
 */
function fnDiv1() {
	str1 = "";
	str1 +="<table border='1'>";
    str1 +="<thead>";
    str1 +="<tr>";
    str1 +="<th width='40'>�⵵</th>";
    str1 +="<th width='100'>���¸�</th>";
    str1 +="<th width='80'>���¹�ȣ</th>";
    str1 +="<th width='100'>�հ�</th>";
    str1 +="</tr>";
}

/**
 * @description div Api2 ���� ����
 */
function fnDiv2() {
	str2 = "";
	str2 +="<table border='1'>";
    str2 +="<thead>";
    str2 +="<tr>";
    str2 +="<th width='40'>�⵵</th>";
    str2 +="<th width='100'>���¸�</th>";
    str2 +="<th width='80'>���¹�ȣ</th>";
    str2 +="</tr>";
}

/**
 * @description div Api3 ���� ����
 */
function fnDiv3() {
	str3 = "";
	str3 +="<table border='1'>";
    str3 +="<thead>";
    str3 +="<tr>";
    str3 +="<th width='40'>�⵵</th>";
    str3 +="<th width='100'>��������</th>";
    str3 +="<th width='80'>�������ڵ�</th>";
    str3 +="<th width='100'>�հ�</th>";
    str3 +="</tr>";
}

/**
 * @description div Api4 ���� ����
 */
function fnDiv4() {
	str4 = "";
	str4 +="<table border='1'>";
    str4 +="<thead>";
    str4 +="<tr>";
    str4 +="<th width='100'>��������</th>";
    str4 +="<th width='80'>�������ڵ�</th>";
    str4 +="<th width='100'>�հ�</th>";
    str4 +="</tr>";
}

/**
 * @description Api1 ��ư Ŭ�� ���� ȣ��
 */
function fnApi1Search(){
	$.ajax({
        type: "POST",
        url: "api1Search.do",
        success: function(data,status, xhr) {
            var jsonStr = JSON.stringify(data);
          	console.log(jsonStr);
          	
          	fnDiv1();
            str1 +="<tr>";
            $.each(data, function(key, item){
                str1 +="<td>"+ item.year+"</td>";	// �⵵
                str1 +="<td>"+ item.name+"</td>";	// ���¸�
                str1 +="<td>"+ item.acctNo+"</td>";	// ���¹�ȣ
                str1 +="<td align='right'>"+ numberWithCommas(item.sumAmt)+"</td>";	// �հ�
                str1 +="</tr>";
            });
            str1 +="</table>";
            str1 +=jsonStr;
            $("#tableList1").html(str1);
        }, error: function() {
            alert("error");
        }
    }); 
}

/**
 * @description Api2 ��ư Ŭ�� ���� ȣ��
 */
function fnApi2Search(){
	$.ajax({
        type: "POST",
        url: "api2Search.do",
        success: function(data,status, xhr) {
            var jsonStr = JSON.stringify(data);
          	console.log(jsonStr);
          	
          	fnDiv2();
            str2 +="<tr>";
            $.each(data, function(key, item){
                str2 +="<td>"+ item.year+"</td>";	// �⵵
                str2 +="<td>"+ item.name+"</td>";	// ���¸�
                str2 +="<td>"+ item.acctNo+"</td>";	// ���¹�ȣ
                str2 +="</tr>";
            });
            str2 +="</table>";
            str2 +=jsonStr;
            $("#tableList2").html(str2);
        }, error: function() {
            alert("error");
        }
    }); 
}

/**
 * @description Api3 ��ư Ŭ�� ���� ȣ��
 */
function fnApi3Search(){
	$.ajax({
        type: "POST",
        url: "api3Search.do",
        success: function(data,status, xhr) {
            var jsonStr = JSON.stringify(data);
          	console.log(jsonStr);
          	fnDiv3();
            str3 +="<tr>";
            $.each(data, function(key, item){
            	str3 +="<td rowspan='"+item.length+"'>"+ key+"</td>";	// �⵵
                for(var i=0; i<item.length; i++)
                {
                    var brName = JSON.stringify(item[i].brName).replace(/\"/gi, ""); 
                    var brCode = JSON.stringify(item[i].brCode).replace(/\"/gi, "");
                    var sumAmt = numberWithCommas(JSON.stringify(item[i].sumAmt));
                	str3 +="<td>"+ brName+"</td>";	// ��������
                    str3 +="<td>"+ brCode+"</td>";	// �������ڵ�
                    str3 +="<td align='right'>"+ sumAmt+"</td>";	// �հ�
                    str3 +="</tr>";
                }
            });
            str3 +="</table>";
            str3 +=jsonStr;
            $("#tableList3").html(str3);
        }, error: function() {
            alert("error");
        }
    }); 
}

/**
 * @description Api4 ��ư Ŭ�� ���� ȣ��
 */
function fnApi4Search(){
	var errorYn ="N";
	var errcode = "";
	var errMessage = "";
	$.ajax({
        type: "POST",
        url: "api4Search.do",
        data: JSON.stringify({"brName": $("#brName").val()}),
        contentType:'application/json; charset=utf-8',
        success: function(data,status, xhr) {
            var jsonStr = JSON.stringify(data);
          	console.log(jsonStr);
          	fnDiv4();
            str4 +="<tr>";
            $.each(data, function(key, item){

				if(item.code == 404)
				{
					errorYn = "Y";
					errcode = item.code;
					errMessage = item.�޼���;
					return;
				}
                
                str4 +="<td>"+ item.brName+"</td>";	// ��������
                str4 +="<td>"+ item.brCode+"</td>";	// �������ڵ�
                str4 +="<td align='right'>"+ numberWithCommas(item.sumAmt)+"</td>";	// �հ�
                str4 +="</tr>";
            });
            if(errorYn == "N")
            {
            	str4 +="</table>";
                str4 +=jsonStr;
                $("#tableList4").html(str4);
            }
            else if(errorYn == "Y")
            {
            	errorForm.code.value	= errcode;
            	errorForm.message.value = errMessage;
            	errorForm.jsonData.value= jsonStr;
            	errorForm.submit();
            }
        }, error: function() {
            alert("error");
        }
    }); 
}

/**
 * @description õ���� ���б�ȣ ǥ��
 */
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>
<body>
<body onload="fnInit();">
	<br><br>
	
	<input type="button" value="API_1" onClick="javascript:fnApi1Search()"><br>
	1. 2018��, 2019�� �� ������ �հ� �ݾ��� ���� ���� ���� �����ϴ� API ����.(��, ��ҿ��ΰ� ��Y�� �ŷ��� ��ҵ� �ŷ���, �հ� �ݾ��� �ŷ��ݾ׿��� �����Ḧ ������ �ݾ���)
	<br>
	<div id="tableList1"></div>
	<br><br>
	
	<input type="button" value="API_2" onClick="javascript:fnApi2Search()"><br>
	2. 2018�� �Ǵ� 2019�⿡ �ŷ��� ���� ���� �����ϴ� API ����.(��ҿ��ΰ� ��Y�� �ŷ��� ��ҵ� �ŷ���)
	<br>
	<div id="tableList2"></div>
	<br><br>
	
	<input type="button" value="API_3" onClick="javascript:fnApi3Search()"><br>
	3. ������ ������ �� �ŷ��ݾ� �հ踦 ���ϰ� �հ�ݾ��� ū ������ ����ϴ� API ����.( ��ҿ��ΰ� ��Y�� �ŷ��� ��ҵ� �ŷ���)
	<br>
	<div id="tableList3"></div>
	<br><br>
	
	<input type="button" value="API_4" onClick="javascript:fnApi4Search()">
	<input type="text" name="brName" id="brName"><br>
	4. �д����� �Ǳ����� �������Ͽ� �Ǳ������� ������ �̰��� �Ͽ����ϴ�. �������� �Է��ϸ� �ش������� �ŷ��ݾ� �հ踦 ����ϴ� API ����( ��ҿ��ΰ� ��Y�� �ŷ��� ��ҵ� �ŷ���)
	<br>
	<div id="tableList4"></div>
	
	<form name="errorForm" method="post" action="error404.jsp" >
		<input type="hidden" name="code"  value="">
		<input type="hidden" name="message" value="">
		<input type="hidden" name="jsonData" value="">
	</form>
	
</body>
</html>
