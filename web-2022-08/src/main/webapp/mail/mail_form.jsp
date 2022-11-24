<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mail/mail_form.jsp</title>
<style>
 #mail{
  width:500px;
  border:3px solid #aaa;
  margin:auto; 50px;
  padding:30px;
 }
 input[type=text]{ width: 450px;}
 textarea{ width: 450px;}
 div>label{ vertical-align: top;}
 .btn{ 
  width:100%;
  text-align: center;
 }
 .msg{
  margin:30px;
  text-align: center;
 }
</style>
</head>
<body>
<div id='mail'>
 <h1>메일 쓰기</h1>
 <form name='form_mail' method='post'>
   <label>수 신</label><input type='text' name='receiver' value="su0328bi@naver.com"><br/>
   <label>제 목</label><input type='text' name='subject'  value="방가..."><br/>
   <div class='content'>
   <label>내 용</label><textarea rows="5" cols="60" name="content">이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다. 영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다. 어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살당했습니다. 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서...</textarea>
   <input type='hidden' name='sender'>
   </div>
   <hr/>
   <div class='btn'>
    <input type='button' value='메일전송(네이버)' onclick="sendMail()"> 
   </div>
 </form>
 <div class='msg'>
  ${msg }
 </div>
</div> 

<script>
 var frm = document.form_mail;
 function sendMail(){
  frm.sender.value="su0328bi@naver.com";
  frm.action='../SendNaverServlet.do';
  frm.submit();
 }
</script>
</body>
</html>
