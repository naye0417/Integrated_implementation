<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>Document</title>
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="${contextPath}/resources/js/js.cookie.js"></script>
<style>
.login_form {
	width: 80%;
	height: 500px;
	/* border: 1px solid black; */
}

#login_detail {
	text-align: center;
}

th {
	font-weight: bold;
	text-align: right;
	height: 50px;
	padding-right: 30px;
	padding-bottom: 10px;
}

#email, #selectEmail {
	width: 120px;
	height: 30px;
}

#text_email {
	width: 150px;
	height: 30px;
}

#user_password {
	width: 300px;
	height: 30px;
}

#btn-login-success {
	width: 100px;
	height: 80px;
	float: right;
	background-color: white;
}

#login_detail {
	display: inline;
	padding-right: 15px;
}

#btn-login-success:hover {
	text-decoration: underline;
	cursor: pointer;
}

#anther_login_box {
	/* border: 1px solid black; */
	height: 100px;
	display: inline;
	/* float: left; */
}

.another_login {
	width: 80px;
	height: 80px;
	border: 1px solid red;
	float: left;
	margin: 20px 50px 0px 0px;
}

#login_detail_box {
	clear: both;
}

.login_detail {
	float: left;
	margin: 20px 50px 0px 0px;
}

.login_detail:hover {
	text-decoration: underline;
	cursor: pointer;
}
</style>
<script>
	//이메일 선택하는 함수
	$(function() {
		$('#selectEmail').change(function() {
			if ($('selectEmail').val() == 'directly') {
				$('#directly').val('');
				$('#text_email').attr("disabled", false);
				$('#text_email').val("");
				$('#text_email').focus();
			} else {
				$('#text_email').val($('#selectEmail').val());
			}
		});
	});

	//쿠키
	// $(document).ready(function () {
	//     //저장된 쿠키값 이메일 칸에 넣어주기 없으면 공백
	//     var key = getCookie("key");
	//     $("#email").val(key);

	//     //이메일칸에 표시 상태라면
	//     if ($("#email").val() != "") {
	//         $("#idSaveCheck").attr("checked", true);   //체크된 상태로
	//     }

	//     $("#idSaveCheck").change(function () {    //체크상태 변화
	//         if ($("#idSaveCheck").is(":checked")) {   //저장하기 했을떄
	//             setCookie("key", $("#email").val(), 7); //쿠키에 7일동안 보관
	//         } else {
	//             deleteCookie("key");
	//         }
	//     })

	// })
	//쿠키에 저장
	$(document).ready(function() {

		//이메일칸 표시상태라면 체크된 상태로 
		$("#email").val(Cookies.get('key'));
		if ($("#email").val() != "") {
			$("#idSaveCheck").attr("checked", true);
		}

		$("#idSaveCheck").change(function() {
			if ($("#idSaveCheck").is(":checked")) {
				Cookies.set('key', $("#email").val(), {
					expires : 7
				});
			} else {
				Cookies.remove('key')
			}
		})

		$("#email").keyup(function() {
			if ($("#idSaveCheck").is(":checked")) {
				Cookies.set('key', $("#email").val(), {
					expires : 7
				});
			}
		})

	})
</script>


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="cntnr">
		<!-- 각자의 파트는 이곳에서부터 작업하실 수 있습니다. -->
		<div class="cntnr-top-margin"></div>


		<div class="login_form">
			<form method="post" action="login.do">
				<table>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="user_email" id="email"
							placeholder="이메일 입력"> @ <input type="text"
							id="text_email" placeholder="이메일을 선택하세요."> <select
							name="selectEmail" id="selectEmail">
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="" id="directly " selected>직접 입력하기</option>
						</select></td>
						<td rowspan="2">
							<button type="submit" id="btn-login-success">로그인</button>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="user_password"
							id="user_password"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="checkbox" id="idSaveCheck">
							아이디 기억하기</td>
					</tr>

				</table>
			</form>
			<div id="anther_login_box">

				<div class="another_login">
					<a href="#" class="loginhere-link">카카오</a>
				</div>
				<div class="another_login">
					<a href="#" class="loginhere-link">페이스북</a>
				</div>
			</div>

			<div id="login_detail_box">

				<div class="login_detail">
					<a href="#" class="loginhere-link">아이디/비밀번호 찾기</a>
				</div>
				<div class="login_detail">
					<a href="#" class="loginhere-link">회원가입</a>
				</div>

			</div>

		</div>




		<!-- 각자의 파트는 이곳까지 작업해주시면 되겠습니다. -->
	</div>


	<jsp:include page="../tail.jsp"></jsp:include>
</body>
</html>