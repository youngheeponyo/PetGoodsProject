<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<!DOCTYPE html>
<html lang="ko">
    <head>
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
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../commonResource/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../commonResource/css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- header -->
        <tiles:insertAttribute name="commonHeader"></tiles:insertAttribute>
        <!-- banner-->
   		<tiles:insertAttribute name="commonBanner"></tiles:insertAttribute>
   		<!-- body -->
   		<tiles:insertAttribute name="commonGridBody"></tiles:insertAttribute>
        <!-- Footer-->
        <tiles:insertAttribute name="commonFooter"></tiles:insertAttribute>
    </body>
</html>
