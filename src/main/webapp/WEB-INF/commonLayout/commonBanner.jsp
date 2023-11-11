<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인페이지에서만 사용되는 banner.jsp -->
<div class="container-fluid bg-light">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  		<ol class="carousel-indicators">
    		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    		<li data-target="#myCarousel" data-slide-to="1"></li>
  		</ol>
  	<div class="text-center carousel-inner">
    	<div class="carousel-item active">
      		<img src="commonResource/image/강아지.png" width="1230" height="500" alt="First slide">
    	</div>
    	<div class="carousel-item">
      		<img src="commonResource/image/배너2.jpg" width="1230" height="500" alt="Second slide">
    	</div>
  	</div>
  	<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    	<span class="sr-only">Previous</span>
  	</a>
  	<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
    	<span class="sr-only">Next</span>
  	</a>
	</div>
</div>
