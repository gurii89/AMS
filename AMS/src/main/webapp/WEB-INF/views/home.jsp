<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
 <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      
      background-image: linear-gradient(to top, #accbee 0%, #e7f0fd 100%);
      height: 150%;
    }
    .top{
    	background-color: #ffffff;
    	height: 13%;
    }
    .right{
    	background-image: linear-gradient(to top, #a3bded 0%, #6991c7 100%);
    }    
  </style>
<body>

   <div class="container-fluid">
      <div class="row content">
      
<!-- ////////////////////////////////////왼쪽 메뉴 시작///////////////////////////////////////// -->     
<%@ include file= "division/left.jsp"%>
<!-- ////////////////////////////////////왼쪽 메뉴 끝///////////////////////////////////////// -->
<!-- ////////////////////////////////////상단 메뉴 시작///////////////////////////////////////// -->
<%@ include file= "division/top.jsp"%>
<!-- ////////////////////////////////////상단 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////가운데 메뉴 시작///////////////////////////////////////// -->			
			 <div class="col-sm-10 top">
			 <h3>해당 내용 위치</h3> 
			 <p>테스트용 텍스트 입니당.Shimmie shimmie Ko Ko Bop think I like it긴장은 down down 부끄러 말고 
				어지러운 마음속에 내가 들어가익숙한 듯 부드럽게 네게 번져가Ah woo 고요한 밤이야Ah woo 널 위한 밤이야참을 수가 없어 빠져가 Yeah yeah
				너의 몸짓에 난 취해가 Yeah yeah가 알던 뻔한 모습의 나를 잊어 오늘숨겨둔 본능이 Shimmie upIt goes down down baby
				리듬에 온몸을It goes down down baby맡기고 소리쳐 Oh 우린 OhWe going Ko Ko Bop
				Hey!
				Shimmie shimmie Ko Ko BopI think I like it조금씩 down down수줍어 말고누가 뭐래도 넌 신경 쓰지 말어지금 이대로 아름답기만 해
				멈춰버렸음 해 Baby are you down?Ah woo 마지막 밤이야Ah woo 둘만의 밤이야긴장하지 말고 다가와 Yeah yeah네 모든 걸 내게 맡겨봐 Yeah yeah
				
				점점 풀려 가는 고삐 더 내려놔 오늘눈치 보지 말고 Shakin’ upIt goes down down baby듬에 온몸을It goes down down baby맡기고 소리쳐 Oh 우린 Oh
				Break it down nowHey!We go down now (Listen!)
				밤은 깊어도 더 빛나는 너너의 그 눈빛이 다 내게 말해기분 좋은 밤 넌 원하고 있어알아 It’s ok 이제 시작해Let’s go!
				It’s about to go goDown down baby리듬에 온몸을It goes down down baby맡기고 소리쳐 Oh 우린 OhGoing Ko Ko Bop
				
				Down down baby귓가에 속삭여It goes down down baby내 맘을 불태워 Oh 미쳐 OhGoing Ko Ko Bop</p>
			 </div>
<!-- ////////////////////////////////////가운데 메뉴 끝///////////////////////////////////////// -->	
<!-- ////////////////////////////////////오른쪽 메뉴 시작///////////////////////////////////////// -->				 
<%@ include file= "division/right.jsp"%>
<!-- ////////////////////////////////////오른쪽 메뉴 끝///////////////////////////////////////// -->	         
		</div>
	</div>
	
</body>
</html>