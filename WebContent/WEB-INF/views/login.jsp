<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Flat Login Form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Montserrat:400,700'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script type="text/javascript">


var ctx = '${pageContext.request.contextPath}';
   window.onload = function(e) {
console.log(ctx);
      var btnCreate = document.getElementById("btnCreate");
      var regForm = document.getElementById("regForm");
      regForm.onsubmit = function() {
    	  alert(1)
         var memberId = document.getElementById('memberId').value;
         var passwd = document.getElementById('passwd').value;
         var memberName = document.getElementById('memberName').vaule;
         var nickName = document.getElementById('nickname').value;
         var email = document.getElementById('email').value;
         
         console.log(memberId);
         console.log(passwd);
         console.log(memberName);
         console.log(nickname);
         console.log(email);
         alert(2)
         if(memberId != '' && passwd != '' && memberName != '' && nickname != '' && email != '') {
        	 
        	 var param = new Object();
        	 param.memberId = memberId;
        	 console.log(param.memberId);
        	 
            // ID 중복 확인  
     		// XMLHttpRequest 객체 정의 - ajax 객체사용 가능 
     		var httpRequest = new XMLHttpRequest();
     		// xmlHttpRequest event
     		// https://developer.mozilla.org/ko/docs/Web/API/XMLHttpRequest 

            alert(3)
     		// readyState 상태가 변경되면 
     	    httpRequest.onreadystatechange = () => {
     	    	// readyState DONE , 서버에서 응답이 왔다면 
     		    if (httpRequest.readyState === XMLHttpRequest.DONE) {
     						// httpRequest 상태(status) 가 OK(200)
   				  console.log("httpRequest.status     " + httpRequest.status);
   			      if (httpRequest.status === 200) {
   				    	var result = httpRequest.response;
   			        console.log(result);
   			        if (result !== 0) {
   			        	alert("ID 중복");
   			        	return false;
   			        }
   			        alert("통과~~~");
   			        // 회원 가입 진행 
   			        regForm.action = ctx + '/sign-up.do';
   			       regForm.submit();
   			        /* 비동기 안에서 작업을 하면 그 안에서 다 해결을 하는 게 좋음(?) */
   			        /* 그 코드의 시간 흐름(?) 때문 */
   			      } else if (httpRequest.status === 404) {
   			        alert('404 Not Found');
   			      } else if (httpRequest.status === 500) {
   			        alert('500 Internal Server Error');
   			      }
   				}
     	    };
     	   alert('hahahh')
     			// Post 방식의 비동기 전송 - 동기(false)면 코드가 넘어가지 않음. 
     	    httpRequest.open('POST', ctx + '/confirmId.do', true);
     			// Post 방식의 동기 전송
//     	  httpRequest.open('POST', '/join.do', false);
			alert('hahahsdfdsfsdfw354535h')
     	    // 요청 Header에 컨텐츠 타입은 Json 정의
     	    httpRequest.setRequestHeader('Content-Type', 'application/json');
     	    // Response Type을 Json으로 정의
     	    httpRequest.responseType = "json";
     	    // Json 형태로 전송
     	    httpRequest.send(JSON.stringify(param));
         }
         return false;
      }
     
      var resultMsg = "${resultMsg}";
      if(resultMsg.length > 0) {
         alert(resultMsg);
      }
   }
</script>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">
  <div class="info">
    <h1>Flat Login Form</h1><span>Made with <i class="fa fa-heart"></i> by <a href="http://andytran.me">Andy Tran</a></span>
  </div>
</div>
<div class="form">
  <div class="thumbnail"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/169963/hat.svg"/></div>
  <form id="regForm" class="register-form" method="post">
    <input type="text" placeholder="ID" name="memberId" id="memberId" required/>
    <span id="idCheckMsg"></span>
    <input type="password" placeholder="Password" name="passwd" id="passwd" required/>
    <input type="text" placeholder="Name" name="memberName" id="memberName" required/>
    <input type="text" placeholder="Nickname" name="nickname" id="nickname" required/>
    <input type="text" placeholder="Email address" name="email" id="email" required/>
    <button id="btnCreate">create</button>
    <p class="message">Already registered? <a href="#">Sign In</a></p>
  </form>
  <form class="login-form">
    <input type="text" placeholder="ID" name="memberId" required/>
    <input type="password" placeholder="Password" name="passwd" required/>
    <button>login</button>
    <p class="message">Not registered? <a href="#">Create an account</a></p>
  </form>
</div>
<video id="video" autoplay="autoplay" loop="loop" poster="polina.jpg">
  <source src="http://andytran.me/A%20peaceful%20nature%20timelapse%20video.mp4" type="video/mp4"/>
</video>
<!-- partial -->
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script  src="${pageContext.request.contextPath}/resources/js/script.js"></script>
  <script>
     
  </script>
</body>
</html>