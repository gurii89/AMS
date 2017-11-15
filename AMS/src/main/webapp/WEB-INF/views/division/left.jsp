<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

         <div class="col-sm-1 sidenav">
         <br>
            <a href="home"><img class="tohome" src="<%=request.getContextPath()%>/img/3333.png"></a>
            <ul class="nav nav-pills nav-stacked">
               <li class="active">
               <span class="glyphicon glyphicon-user"><span class="level">권한:${loginfor.eDepartment}</span></span>
               <div class="loginfo"><a href="#" class="myinfor">${loginfor.eName}(${loginfor.eId})님</a></div>
               <div class="loginfo">안녕하세요!</div>
               <form method="post" action="./logout">
               <input class="logout" type="submit" value="LOGOUT">
               </form>
               </li>
               <br>
               <li><a href="#section2" class="level">직원</a></li>
               <li><a href="#section3" class="level">프론트</a></li>
               <li><a href="./roomMain" class="level">객실</a></li>
               <li><a href="#section3" class="level">예약</a></li>
               <li><a href="extraList" class="level">서비스</a></li>
               <li><a href="guestList" class="level">고객</a></li>
               <li><a href="#section3" class="level">메뉴7</a></li>
               <li><a href="#section3" class="level">메뉴8</a></li>
               <li><a href="#section3" class="level">메뉴9</a></li>
               <li><a href="#section3" class="level">메뉴10</a></li>
               <li><a href="./noticeList" class="level">공지사항</a></li>
               <li><a href="cateList" class="level">카테고리</a></li>
            </ul>
            <br>
         </div>