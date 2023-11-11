<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
    	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    	<style>
    		.custom-padding {
    			padding-top: 0.8rem;
    		}
    		.far:hover {
    			color:8B00FF;
    		}
    		
    	</style>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>마이디어 펫</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../commonResource/assets/favicon.ico" />
        
        <!-- Core theme JS-->
        <!-- <script src="../commonResource/js/scripts.js"></script>  -->
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../commonResource/css/styles.css" rel="stylesheet" /> 
    </head>
    <body>
        <!-- header -->
        <tiles:insertAttribute name="commonHeader"></tiles:insertAttribute>
        <!-- banner-->
        <c:if test="${!empty main }"> <!-- 배너이미지는 메인페이지에서만 등장 -->
   			<tiles:insertAttribute name="commonBanner"></tiles:insertAttribute>
   		</c:if>
   		<!-- body -->
   		<tiles:insertAttribute name="commonGridBody"></tiles:insertAttribute>
        <!-- Footer-->
        <tiles:insertAttribute name="commonFooter"></tiles:insertAttribute>
    </body>
</html>
