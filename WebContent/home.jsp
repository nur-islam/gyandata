<!DOCTYPE html>
<%@ page import="com.gyanpedia.model.User"%>
<%@ page import="com.gyanpedia.model.ContentReply"%>
<%@ page import="com.gyanpedia.model.PostContent"%>
<%@ page import="java.util.List"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Online Tutorial System</title>
	<!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
   <style>
         .ui-widget-header,.ui-state-default, ui-button{
            background:#b9cd6d;
            border: 1px solid #b9cd6d;
            color: #FFFFFF;
            font-weight: bold;
         }
      </style>
</head><!--/head-->

<body class="homepage">
	<%User user = (User)session.getAttribute("authenticatUser");%>
	<input type="hidden" id="loggedInUserId" value="<%=user.getUserid() %>">
    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                        <div class="top-number"><p>
						 <i class="fa fa-user"></i>&nbsp&nbsp&nbsp&nbsp Welcome
						<%out.print(user.getName());%>
						</p></div>
                    </div>
                    <div class="col-sm-6 col-xs-8">
                       <div class="social">
                            <ul class="social-share">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li> 
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype"></i></a></li>
                            </ul>
                            <div class="search">
                                <form role="form">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                    <i class="fa fa-search"></i>
                                </form>
                           </div>
                       </div>
                    </div>
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->
		
        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="logo11.jpg" width="300" height="50"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">

                        <li><a href="about-us.html">About Us</a></li>
                        <li><a href="services.html">Services</a></li>
                        <li><a href="portfolio.html">Portfolio</a></li>
                        
                        <li><a href="blog.html">Blog</a></li> 
                        <li><a href="contact-us.html">Contact</a></li>
                         <li><a href="LoggedOut.html">Logout</a></li>  
						
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->
	<br>
    <div class="row">

								<!-- main col left -->
								<div style="width: 30%" class="col-sm-5">

									<div class="panel panel-default">
										<div class="panel-body">
											<h4><%out.print(user.getName());%>&nbsp;<span class="lead">(total posts: <%=user.getContentCount() %>, total replies: <%=user.getContentReplyCount() %>)</span></h4>
										</div>
										<div style="text-align: center;" class="panel-thumbnail">
											<img width="250" height="250" border="2" src="<%= user.getImage()%>">
										</div>
										<br>
									</div>


									<div class="panel panel-default">
										<div class="panel-heading">
											<h4>About</h4>
											<span class="glyphicon glyphicon-edit edit-profile" style="float: right; margin-top: -33px;">&nbsp;Edit</span>
										</div>
										<div class="panel-body">
											<div class="list-group">
												<p class="glyphicon glyphicon-map-marker">
													&nbsp;<b>From</b> <%=user.getCountry()%>
												</p>
												<br>
												<p class="glyphicon glyphicon-home">
													&nbsp;<b>Lives in</b> <%=user.getStreet()%>, <%=user.getCity()%>, <%=user.getState()%>.
												</p>
												<br>
												<p class="glyphicon glyphicon glyphicon-briefcase">
													&nbsp;<b>Working in</b> <%=user.getOrganization()%> as <%=user.getRole()%>.
												</p>
												<br>
												<p class="glyphicon glyphicon glyphicon-globe">
													&nbsp;<b>Lives in</b> <%=user.getPincode()%>
												</p>
												<br>
												<p class="glyphicon glyphicon-book">
													&nbsp;<b>Education</b> <%=user.getStream()%>
												</p>
												<br>
												<p class="glyphicon glyphicon glyphicon-envelope">
													&nbsp;<b>Email</b> <%=user.getEmail()%>
												</p>
												<br>
												<p class="glyphicon glyphicon glyphicon-phone">
													&nbsp;<b>Phone</b> <%=user.getPhone()%>
												</p>
												<br>
												<p class="glyphicon glyphicon-calendar">
													&nbsp;<b>Born on</b> <%=user.getBirthDate()%>
												</p>
												<br>
												<p class="glyphicon glyphicon-user">
													&nbsp;<b>Sex</b> <%=user.getGender()%>
												</p>
											</div>
										</div>
									</div>
								</div>
								<!-- main col right -->
								<div style="width: 70%" class="col-sm-7">
									<div class="well">
										<form role="form" class="form-horizontal">
											<h4>What's New</h4>
											<div style="padding: 14px;" class="form-group">
												<ul class="list-inline">
												<li>Upload File: <a href="" class="upload-comment-file"><i
														class="glyphicon glyphicon-upload"></i></a></li>
											</ul>
											<textarea placeholder="What's on your mind?" class="form-control" id="postContent"></textarea>
											</div>
											<button id="postContentBtn" type="button" class="btn btn-primary" userId="<%=user.getUserid()%>">Post</button>
										</form>
									</div>
									<div id="content-details">
									</div>
								</div>
							</div>
							<div id="upload-dailog" style="display: none;">
								<form action="uploaddownloadcontroller" method="post"
									enctype="multipart/form-data">
									Select File to Upload:<input type="file" name="fileName"> <br>
									<input type="hidden" name="action" value="uploadFile"> <input
										type="submit" value="Upload">
								</form>
							</div>
	<script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/ckeditor/ckeditor.js"></script>
    <script src="js/gyanpedia.content.js"></script>
</body>
</html>