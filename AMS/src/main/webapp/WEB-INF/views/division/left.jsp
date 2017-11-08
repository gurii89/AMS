<%@ page isELIgnored ="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cafe24.guribyn.login.EmployeeTest" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>

         <div class="col-sm-1 sidenav">
            <h2>로고메</h2><br>
            <ul class="nav nav-pills nav-stacked">
               <li class="active">
               <p class="loginfo">${loginemployee.eName}(${loginemployee.eId})님</p>
               <p class="loginfo">안녕하세요!</p>
               </li>
               <li><a href="#section2">직원</a></li>
               <li><a href="#section3">프론트</a></li>
               <li><a href="#section3">객실</a></li>
               <li><a href="#section3">예약</a></li>
               <li><a href="#section3">서비스</a></li>
               <li><a href="#section3">메뉴6</a></li>
               <li><a href="#section3">메뉴7</a></li>
               <li><a href="#section3">메뉴8</a></li>
               <li><a href="#section3">메뉴9</a></li>
               <li><a href="#section3">메뉴10</a></li>
               <li><a href="#section3">공지사항</a></li>
               <li><a href="./cateAdd">카테고리</a></li>
            </ul>
            <br>
         </div>
         