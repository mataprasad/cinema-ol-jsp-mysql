<%@ page import="java.util.*,com.app.bean.json.*,com.app.util.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<t:_layout>
	<jsp:attribute name="head">    
	<link rel="stylesheet" type="text/css"
			href="<c:url value="/resources/wt-rotator.css"/>" />
	<script type="text/javascript"
			src="<c:url value="/resources/jquery.easing.1.3.min.js"/>"></script>
	<script type="text/javascript"
			src="<c:url value="/resources/jquery.wt-rotator.min.js"/>"></script>
	<!--[if lt IE 9]>
	  	<style>
	    	.panel {
		    	border-left:1px solid #444;
				border-right:1px solid #444;
	        }
	        </style>
	    <![endif]-->
	<script type="text/javascript">
		$(document).ready(function() {
			var $panel = $(".panel");
			var $container = $panel.find(".container");

			$container.wtRotator({
				width : 620,
				height : 300,
				thumb_width : 24,
				thumb_height : 24,
				button_width : 24,
				button_height : 24,
				button_margin : 5,
				auto_start : true,
				delay : 3000,
				transition : "fade",
				transition_speed : 800,
				block_size : 75,
				vert_size : 55,
				horz_size : 50,
				cpanel_align : "BR",
				timer_align : "top",
				display_thumbs : false,
				display_dbuttons : false,
				display_playbutton : false,
				display_thumbimg : false,
				display_side_buttons : false,
				tooltip_type : "",
				display_numbers : false,
				display_timer : false,
				mouseover_pause : true,
				cpanel_mouseover : false,
				text_mouseover : false,
				text_effect : "fade",
				text_sync : true,
				shuffle : true,
				block_delay : 25,
				vstripe_delay : 73,
				hstripe_delay : 183
			});
		});
	</script>
	</jsp:attribute>
	<jsp:body>
	<div style="height: 350px;">
		<div style="width: 620px; float: left; height: 300px;">
			<div class="panel">
				<div class="container">
					<div class="wt-rotator">
						<div class="screen">
							<noscript>
								<img src="<c:url value="/images/sf.jpg"/>" alt="" />
							</noscript>
						</div>
						<div class="c-panel">
							<div class="thumbnails">
								<ul>
								<li>
<t:_movieSlidShow></t:_movieSlidShow>
								
									</ul>
							</div>
							<div class="buttons">
								<div class="prev-btn"></div>
								<div class="play-btn"></div>
								<div class="next-btn"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div align="center"
				style="width: 350px; float: right; height: 300px; border: 1px solid #000000;">
			<div
					style="border-style: none none solid none; border-width: 1px; border-color: #000000; width: 350px; height: 30px; background-color: #6600CC;">
				<a
						style="font-size: 15pt; color: White; display: block; vertical-align: middle; line-height: 30px; text-align: justify; margin-left: 7px;">BOOK
					YOUR TICKETS HERE</a>
			</div>
			<h1></h1>
	<t:_selectShow></t:_selectShow>
		</div>
	
	</div>
	</jsp:body>

</t:_layout>

