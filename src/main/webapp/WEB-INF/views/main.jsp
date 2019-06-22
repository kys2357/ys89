<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>특정 고객 거래내역 조회 서비스</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var str1 = ""; // div Api1 문자열
var str2 = ""; // div Api2 문자열
var str3 = ""; // div Api3 문자열
var str4 = ""; // div Api4 문자열

/**
 * @description 온로드시 초기화
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
 * @description div Api1 동적 생성
 */
function fnDiv1() {
	str1 = "";
	str1 +="<table border='1'>";
    str1 +="<thead>";
    str1 +="<tr>";
    str1 +="<th width='40'>년도</th>";
    str1 +="<th width='100'>계좌명</th>";
    str1 +="<th width='80'>계좌번호</th>";
    str1 +="<th width='100'>합계</th>";
    str1 +="</tr>";
}

/**
 * @description div Api2 동적 생성
 */
function fnDiv2() {
	str2 = "";
	str2 +="<table border='1'>";
    str2 +="<thead>";
    str2 +="<tr>";
    str2 +="<th width='40'>년도</th>";
    str2 +="<th width='100'>계좌명</th>";
    str2 +="<th width='80'>계좌번호</th>";
    str2 +="</tr>";
}

/**
 * @description div Api3 동적 생성
 */
function fnDiv3() {
	str3 = "";
	str3 +="<table border='1'>";
    str3 +="<thead>";
    str3 +="<tr>";
    str3 +="<th width='40'>년도</th>";
    str3 +="<th width='100'>관리점명</th>";
    str3 +="<th width='80'>관리점코드</th>";
    str3 +="<th width='100'>합계</th>";
    str3 +="</tr>";
}

/**
 * @description div Api4 동적 생성
 */
function fnDiv4() {
	str4 = "";
	str4 +="<table border='1'>";
    str4 +="<thead>";
    str4 +="<tr>";
    str4 +="<th width='100'>관리점명</th>";
    str4 +="<th width='80'>관리점코드</th>";
    str4 +="<th width='100'>합계</th>";
    str4 +="</tr>";
}

/**
 * @description Api1 버튼 클릭 서비스 호출
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
                str1 +="<td>"+ item.year+"</td>";	// 년도
                str1 +="<td>"+ item.name+"</td>";	// 계좌명
                str1 +="<td>"+ item.acctNo+"</td>";	// 계좌번호
                str1 +="<td align='right'>"+ numberWithCommas(item.sumAmt)+"</td>";	// 합계
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
 * @description Api2 버튼 클릭 서비스 호출
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
                str2 +="<td>"+ item.year+"</td>";	// 년도
                str2 +="<td>"+ item.name+"</td>";	// 계좌명
                str2 +="<td>"+ item.acctNo+"</td>";	// 계좌번호
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
 * @description Api3 버튼 클릭 서비스 호출
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
            	str3 +="<td rowspan='"+item.length+"'>"+ key+"</td>";	// 년도
                for(var i=0; i<item.length; i++)
                {
                    var brName = JSON.stringify(item[i].brName).replace(/\"/gi, ""); 
                    var brCode = JSON.stringify(item[i].brCode).replace(/\"/gi, "");
                    var sumAmt = numberWithCommas(JSON.stringify(item[i].sumAmt));
                	str3 +="<td>"+ brName+"</td>";	// 관리점명
                    str3 +="<td>"+ brCode+"</td>";	// 관리점코드
                    str3 +="<td align='right'>"+ sumAmt+"</td>";	// 합계
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
 * @description Api4 버튼 클릭 서비스 호출
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
					errMessage = item.메세지;
					return;
				}
                
                str4 +="<td>"+ item.brName+"</td>";	// 관리점명
                str4 +="<td>"+ item.brCode+"</td>";	// 관리점코드
                str4 +="<td align='right'>"+ numberWithCommas(item.sumAmt)+"</td>";	// 합계
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
 * @description 천단위 구분기호 표시
 */
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>
<body>
<body onload="fnInit();">
	<br><br>
	
	<input type="button" value="API_1" onClick="javascript:fnApi1Search()"><br>
	1. 2018년, 2019년 각 연도별 합계 금액이 가장 많은 고객을 추출하는 API 개발.(단, 취소여부가 ‘Y’ 거래는 취소된 거래임, 합계 금액은 거래금액에서 수수료를 차감한 금액임)
	<br>
	<div id="tableList1"></div>
	<br><br>
	
	<input type="button" value="API_2" onClick="javascript:fnApi2Search()"><br>
	2. 2018년 또는 2019년에 거래가 없는 고객을 추출하는 API 개발.(취소여부가 ‘Y’ 거래는 취소된 거래임)
	<br>
	<div id="tableList2"></div>
	<br><br>
	
	<input type="button" value="API_3" onClick="javascript:fnApi3Search()"><br>
	3. 연도별 관리점 별 거래금액 합계를 구하고 합계금액이 큰 순서로 출력하는 API 개발.( 취소여부가 ‘Y’ 거래는 취소된 거래임)
	<br>
	<div id="tableList3"></div>
	<br><br>
	
	<input type="button" value="API_4" onClick="javascript:fnApi4Search()">
	<input type="text" name="brName" id="brName"><br>
	4. 분당점과 판교점을 통폐합하여 판교점으로 관리점 이관을 하였습니다. 지점명을 입력하면 해당지점의 거래금액 합계를 출력하는 API 개발( 취소여부가 ‘Y’ 거래는 취소된 거래임)
	<br>
	<div id="tableList4"></div>
	
	<form name="errorForm" method="post" action="error404.jsp" >
		<input type="hidden" name="code"  value="">
		<input type="hidden" name="message" value="">
		<input type="hidden" name="jsonData" value="">
	</form>
	
</body>
</html>
