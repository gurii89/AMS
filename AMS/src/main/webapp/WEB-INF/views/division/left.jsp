<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

         <div class="col-sm-1 sidenav">
         <br>
            <a href="home"><img class="tohome" src="<c:url value='/resources/img/3333.png'/>"></a>
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
               <li><a href="employeeList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 직원</a></li>
               <li><a href="./frontMain" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 프론트</a></li>
               <li><a href="./roomMain" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 객실</a></li>
               <li><a href="bookingList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 예약</a></li>
               <li><a href="extraList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 서비스</a></li>
               <li><a href="guestList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 고객</a></li>
               <li><a href="itemList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 물품</a></li>
               <li><a href="deliveryList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 운송</a></li>
               <li><a href="./keepList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 보관품</a></li>
               <li><a href="eventList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 행사</a></li>
               <li><a href="./noticeList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 공지사항</a></li>
               <li><a href="cateList" class="level"><span class="glyphicon glyphicon-chevron-right"></span> 카테고리</a></li>
            </ul>
            <br>
         </div>