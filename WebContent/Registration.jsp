
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Registration Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <script type="text/javascript" src="jquery-1.8.2.min.js"></script>
    
    
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->
<body>

	<header id="header">
	<div class="top-bar">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-xs-4">
					<div class="top-number">
						<div class="container">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target=".navbar-collapse">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="index.html"><img
									src="logo11.jpg" width="300" height="50"></img> </a>
							</div>

						</div>
					</div>
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
								<input type="text" class="search-form" autocomplete="off"
									placeholder="Search"> <i class="fa fa-search"></i>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.container-->
	</div>
	<!--/.top-bar--> <nav class="navbar navbar-inverse" role="banner">

	<!--/.container--> </nav><!--/nav--> </header>
	<!--/header-->
	<br>
<section id="feature" style="padding:0px !important;">
	<div style="font-size: 19px; font-weight: bold; text-align: center;">Please fill up the below details</div>
	<%if(request.getAttribute("msg") != null) {%>
		<div style="color:red;font-weight:bold;text-align:center;"><%=request.getAttribute("msg") %></div>
	<%} %>
<form action="gyanpediacontroller" method="post" id="registerForm">
<input type="hidden" name="action" value="register">
	<div class="container">
		<div class="row">
			<div class="features">
				<div class="col-md-4 col-sm-6 wow fadeInDown"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<div class="feature-wrap">

						<fieldset class="row1">
							<br />
							<legend>
								<br />Account Details
							</legend>
							<label>Email *</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<input type="email" name="email"
								placeholder="  something@domain.com" size="29" required />
							<p>
								<br /> <label>Password*</label>&nbsp&nbsp&nbsp&nbsp&nbsp <input
									id="password" type="password" name="password" size="29"
									placeholder="  password" required style="margin-left: 4px;"/>
							</p>
							<br /> <br />
							<fieldset class="row2">
								<legend>Personal Details</legend>
								<p>
									<label>Name *
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label> <input
										id="name" type="text" name="name" placeholder="  Full Name"
										size="29" required style="margin-left: 100px; margin-top: -28px;"/>
								</p>
								<p>
									<label>Phone *
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label> <input
										id="phone" type="text" name="phone" size="29"
										placeholder="  10 digit phone No" required style="margin-left: 100px; margin-top: -28px;"/>
								</p>
								<p>
									<label>Gender *
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</label> <input id="gender" type="radio" name="gender" value="Male"
										required /> <label class="gender">Male</label>&nbsp&nbsp&nbsp&nbsp
									<input type="radio" name="gender" value="Female" /> <label
										class="gender">Female</label>
								</p>
								<p>
									<label>Birthdate *</label>
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									<input type="date" id="birthdate" name="birthdate" size="29"
										required style="margin-left: 100px; margin-top: -28px;"/>
								</p>
								<p>
									<label>Nationality * </label> <SELECT id="nationality"
										NAME="nationality" style="margin-left: 100px; margin-bottom: 10px; margin-top: -17px;">
										<OPTION SELECTED>- Select Nationality -
										<OPTION>Afghanistan
										<OPTION>Aland Islands
										<OPTION>Albania
										<OPTION>Algeria
										<OPTION>American Samoa
										<OPTION>Andorra
										<OPTION>Angola
										<OPTION>Anguilla
										<OPTION>Antarctica
										<OPTION>Antigua and Barbuda
										<OPTION>Argentina
										<OPTION>Armenia
										<OPTION>Aruba
										<OPTION>Australia
										<OPTION>Austria
										<OPTION>Azerbaijan
										<OPTION>Bahamas
										<OPTION>Bahrain
										<OPTION>Bangladesh
										<OPTION>Barbados
										<OPTION>Belarus
										<OPTION>Belgium
										<OPTION>Belize
										<OPTION>Benin
										<OPTION>Bermuda
										<OPTION>Bhutan
										<OPTION>Bolivia
										<OPTION>Bosnia and Herzegovina
										<OPTION>Botswana
										<OPTION>Bouvet Island
										<OPTION>Brazil
										<OPTION>British Indian Ocean Territory
										<OPTION>British Virgin Islands
										<OPTION>Brunei
										<OPTION>Bulgaria
										<OPTION>Burkina Faso
										<OPTION>Burundi
										<OPTION>Cambodia
										<OPTION>Cameroon
										<OPTION>Canada
										<OPTION>Cape Verde
										<OPTION>Cayman Islands
										<OPTION>Central African Republic
										<OPTION>Chad
										<OPTION>Chile
										<OPTION>China
										<OPTION>Christmas Island
										<OPTION>Cocos (Keeling) Islands
										<OPTION>Colombia
										<OPTION>Comoros
										<OPTION>Congo
										<OPTION>Cook Islands
										<OPTION>Costa Rica
										<OPTION>Croatia
										<OPTION>Cuba
										<OPTION>Cyprus
										<OPTION>Czech Republic
										<OPTION>Democratic Republic of Congo
										<OPTION>Denmark
										<OPTION>Disputed Territory
										<OPTION>Djibouti
										<OPTION>Dominica
										<OPTION>Dominican Republic
										<OPTION>East Timor
										<OPTION>Ecuador
										<OPTION>Egypt
										<OPTION>El Salvador
										<OPTION>Equatorial Guinea
										<OPTION>Eritrea
										<OPTION>Estonia
										<OPTION>Ethiopia
										<OPTION>Falkland Islands
										<OPTION>Faroe Islands
										<OPTION>Federated States of Micronesia
										<OPTION>Fiji
										<OPTION>Finland
										<OPTION>France
										<OPTION>French Guyana
										<OPTION>French Polynesia
										<OPTION>French Southern Territories
										<OPTION>Gabon
										<OPTION>Gambia
										<OPTION>Georgia
										<OPTION>Germany
										<OPTION>Ghana
										<OPTION>Gibraltar
										<OPTION>Greece
										<OPTION>Greenland
										<OPTION>Grenada
										<OPTION>Guadeloupe
										<OPTION>Guam
										<OPTION>Guatemala
										<OPTION>Guinea
										<OPTION>Guinea-Bissau
										<OPTION>Guyana
										<OPTION>Haiti
										<OPTION>Heard Island and Mcdonald Islands
										<OPTION>Honduras
										<OPTION>Hong Kong
										<OPTION>Hungary
										<OPTION>Iceland
										<OPTION>India
										<OPTION>Indonesia
										<OPTION>Iran
										<OPTION>Iraq
										<OPTION>Iraq-Saudi Arabia Neutral Zone
										<OPTION>Ireland
										<OPTION>Israel
										<OPTION>Italy
										<OPTION>Ivory Coast
										<OPTION>Jamaica
										<OPTION>Japan
										<OPTION>Jordan
										<OPTION>Kazakhstan
										<OPTION>Kenya
										<OPTION>Kiribati
										<OPTION>Kuwait
										<OPTION>Kyrgyzstan
										<OPTION>Laos
										<OPTION>Latvia
										<OPTION>Lebanon
										<OPTION>Lesotho
										<OPTION>Liberia
										<OPTION>Libya
										<OPTION>Liechtenstein
										<OPTION>Lithuania
										<OPTION>Luxembourg
										<OPTION>Macau
										<OPTION>Macedonia
										<OPTION>Madagascar
										<OPTION>Malawi
										<OPTION>Malaysia
										<OPTION>Maldives
										<OPTION>Mali
										<OPTION>Malta
										<OPTION>Marshall Islands
										<OPTION>Martinique
										<OPTION>Mauritania
										<OPTION>Mauritius
										<OPTION>Mayotte
										<OPTION>Mexico
										<OPTION>Moldova
										<OPTION>Monaco
										<OPTION>Mongolia
										<OPTION>Montserrat
										<OPTION>Morocco
										<OPTION>Mozambique
										<OPTION>Myanmar
										<OPTION>Namibia
										<OPTION>Nauru
										<OPTION>Nepal
										<OPTION>Netherlands
										<OPTION>Netherlands Antilles
										<OPTION>New Caledonia
										<OPTION>New Zealand
										<OPTION>Nicaragua
										<OPTION>Niger
										<OPTION>Nigeria
										<OPTION>Niue
										<OPTION>Norfolk Island
										<OPTION>North Korea
										<OPTION>Northern Mariana Islands
										<OPTION>Norway
										<OPTION>Oman
										<OPTION>Pakistan
										<OPTION>Palau
										<OPTION>Palestinian Territories
										<OPTION>Panama
										<OPTION>Papua New Guinea
										<OPTION>Paraguay
										<OPTION>Peru
										<OPTION>Philippines
										<OPTION>Pitcairn Islands
										<OPTION>Poland
										<OPTION>Portugal
										<OPTION>Puerto Rico
										<OPTION>Qatar
										<OPTION>Reunion
										<OPTION>Romania
										<OPTION>Russia
										<OPTION>Rwanda
										<OPTION>Saint Helena and Dependencies
										<OPTION>Saint Kitts and Nevis
										<OPTION>Saint Lucia
										<OPTION>Saint Pierre and Miquelon
										<OPTION>Saint Vincent and the Grenadines
										<OPTION>Samoa
										<OPTION>San Marino
										<OPTION>Sao Tome and Principe
										<OPTION>Saudi Arabia
										<OPTION>Senegal
										<OPTION>Seychelles
										<OPTION>Sierra Leone
										<OPTION>Singapore
										<OPTION>Slovakia
										<OPTION>Slovenia
										<OPTION>Solomon Islands
										<OPTION>Somalia
										<OPTION>South Africa
										<OPTION>South Georgia and South Sandwich Islands
										<OPTION>South Korea
										<OPTION>Spain
										<OPTION>Spratly Islands
										<OPTION>Sri Lanka
										<OPTION>Sudan
										<OPTION>Suriname
										<OPTION>Svalbard and Jan Mayen
										<OPTION>Swaziland
										<OPTION>Sweden
										<OPTION>Switzerland
										<OPTION>Syria
										<OPTION>Taiwan
										<OPTION>Tajikistan
										<OPTION>Tanzania
										<OPTION>Thailand
										<OPTION>Togo
										<OPTION>Tokelau
										<OPTION>Tonga
										<OPTION>Trinidad and Tobago
										<OPTION>Tunisia
										<OPTION>Turkey
										<OPTION>Turkmenistan
										<OPTION>Turks And Caicos Islands
										<OPTION>Tuvalu
										<OPTION>Uganda
										<OPTION>Ukraine
										<OPTION>United Arab Emirates
										<OPTION>United Kingdom
										<OPTION>United States
										<OPTION>United States Minor Outlying Islands
										<OPTION>Uruguay
										<OPTION>US Virgin Islands
										<OPTION>Uzbekistan
										<OPTION>Vanuatu
										<OPTION>Vatican City
										<OPTION>Venezuela
										<OPTION>Vietnam
										<OPTION>Wallis and Futuna
										<OPTION>Western Sahara
										<OPTION>Yemen
										<OPTION>Zambia
										<OPTION>Zimbabwe
										<OPTION>Serbia
										<OPTION>Montenegro
									</SELECT>
								</p>
								
								
					</div>
					<div>
					<fieldset>
						<legend>
								<br />Professional Details
							</legend>
						<label>Role *
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								</label>&nbsp&nbsp <SELECT id="role" NAME="Role" required style="margin-left: 100px; margin-top: -22px; margin-bottom: 10px;">
									<OPTION SELECTED>- Select Your Role -
									<OPTION>Teacher
									<OPTION>Student
									<OPTION>Guest User
								</SELECT>
								<p>
									<label>Organization *
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</label> <input id="organization" type="text" name="organization"
										size="29" placeholder="  Enter your Organization name"
										required style="margin-left: 100px; margin-top: -28px;"/>
								</p>
								<p>
									<label>Stream *
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</label> &nbsp&nbsp <SELECT id="stream" NAME="stream" required style="margin-left: 100px; margin-top: -23px;">
										<OPTION SELECTED>- Select Stream -
										<OPTION>C.S.E
										<OPTION>E.C.E
										<OPTION>I.T
										<OPTION>E.E
										<OPTION>M.E
										<OPTION>CIVIL.E
										<OPTION>A.I.E
										<OPTION>B.M.E
										<OPTION>E.E.E
									</SELECT>
								</p>
					</fieldset>
				</div>
				
				</div>
				<!--/.col-md-4-->
				<div class="col-md-4 col-sm-6 wow fadeInDown"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<div class="feature-wrap">
						<fieldset class="row1">
							<br />
							<legend>
								<br />&nbsp
							</legend>


							<label>Repeat email *&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
							<input id="email" type="email"
								placeholder="  something@domain.com" size="27" required />
							<p>
								<br /> <label>Repeat Password*</label> <input id="password"
									type="password" size="27" placeholder="  password" required />
							</p>

							<br /> <br />
							<fieldset class="row3">
								<legend>Contact Information </legend>
								<p>
									<label class="optional">Street
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </label>
									<input id=street type="text" name="streetname" size="29"
										placeholder="  Street Name" />
								</p>
								<p>
									<label>City *
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</label> <input id="city" type="text" name="city" size="29"
										placeholder="  Enter your City" required />
								</p>
								<p>
									<label>State *
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</label> <input id="state" type="text" name="state" size="29"
										placeholder="  Enter your State" required style="margin-left: 100px; margin-top: -28px;"/>
								</p>
								<p>
									<label>PinCode *
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</label> <input id="pincode" type="text" name="pincode" size="29"
										placeholder="  Enter your PinCode" required style="margin-left: 100px; margin-top: -28px;"/>
								</p>
								<p>
									<label>Country *
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									</label> &nbsp&nbsp <SELECT id="country" NAME="country" required style="margin-left: 100px; margin-top: -17px;">
										<OPTION SELECTED>- Select Country -
										<OPTION>Afghanistan
										<OPTION>Aland Islands
										<OPTION>Albania
										<OPTION>Algeria
										<OPTION>American Samoa
										<OPTION>Andorra
										<OPTION>Angola
										<OPTION>Anguilla
										<OPTION>Antarctica
										<OPTION>Antigua and Barbuda
										<OPTION>Argentina
										<OPTION>Armenia
										<OPTION>Aruba
										<OPTION>Australia
										<OPTION>Austria
										<OPTION>Azerbaijan
										<OPTION>Bahamas
										<OPTION>Bahrain
										<OPTION>Bangladesh
										<OPTION>Barbados
										<OPTION>Belarus
										<OPTION>Belgium
										<OPTION>Belize
										<OPTION>Benin
										<OPTION>Bermuda
										<OPTION>Bhutan
										<OPTION>Bolivia
										<OPTION>Bosnia and Herzegovina
										<OPTION>Botswana
										<OPTION>Bouvet Island
										<OPTION>Brazil
										<OPTION>British Indian Ocean Territory
										<OPTION>British Virgin Islands
										<OPTION>Brunei
										<OPTION>Bulgaria
										<OPTION>Burkina Faso
										<OPTION>Burundi
										<OPTION>Cambodia
										<OPTION>Cameroon
										<OPTION>Canada
										<OPTION>Cape Verde
										<OPTION>Cayman Islands
										<OPTION>Central African Republic
										<OPTION>Chad
										<OPTION>Chile
										<OPTION>China
										<OPTION>Christmas Island
										<OPTION>Cocos (Keeling) Islands
										<OPTION>Colombia
										<OPTION>Comoros
										<OPTION>Congo
										<OPTION>Cook Islands
										<OPTION>Costa Rica
										<OPTION>Croatia
										<OPTION>Cuba
										<OPTION>Cyprus
										<OPTION>Czech Republic
										<OPTION>Democratic Republic of Congo
										<OPTION>Denmark
										<OPTION>Disputed Territory
										<OPTION>Djibouti
										<OPTION>Dominica
										<OPTION>Dominican Republic
										<OPTION>East Timor
										<OPTION>Ecuador
										<OPTION>Egypt
										<OPTION>El Salvador
										<OPTION>Equatorial Guinea
										<OPTION>Eritrea
										<OPTION>Estonia
										<OPTION>Ethiopia
										<OPTION>Falkland Islands
										<OPTION>Faroe Islands
										<OPTION>Federated States of Micronesia
										<OPTION>Fiji
										<OPTION>Finland
										<OPTION>France
										<OPTION>French Guyana
										<OPTION>French Polynesia
										<OPTION>French Southern Territories
										<OPTION>Gabon
										<OPTION>Gambia
										<OPTION>Georgia
										<OPTION>Germany
										<OPTION>Ghana
										<OPTION>Gibraltar
										<OPTION>Greece
										<OPTION>Greenland
										<OPTION>Grenada
										<OPTION>Guadeloupe
										<OPTION>Guam
										<OPTION>Guatemala
										<OPTION>Guinea
										<OPTION>Guinea-Bissau
										<OPTION>Guyana
										<OPTION>Haiti
										<OPTION>Heard Island and Mcdonald Islands
										<OPTION>Honduras
										<OPTION>Hong Kong
										<OPTION>Hungary
										<OPTION>Iceland
										<OPTION>India
										<OPTION>Indonesia
										<OPTION>Iran
										<OPTION>Iraq
										<OPTION>Iraq-Saudi Arabia Neutral Zone
										<OPTION>Ireland
										<OPTION>Israel
										<OPTION>Italy
										<OPTION>Ivory Coast
										<OPTION>Jamaica
										<OPTION>Japan
										<OPTION>Jordan
										<OPTION>Kazakhstan
										<OPTION>Kenya
										<OPTION>Kiribati
										<OPTION>Kuwait
										<OPTION>Kyrgyzstan
										<OPTION>Laos
										<OPTION>Latvia
										<OPTION>Lebanon
										<OPTION>Lesotho
										<OPTION>Liberia
										<OPTION>Libya
										<OPTION>Liechtenstein
										<OPTION>Lithuania
										<OPTION>Luxembourg
										<OPTION>Macau
										<OPTION>Macedonia
										<OPTION>Madagascar
										<OPTION>Malawi
										<OPTION>Malaysia
										<OPTION>Maldives
										<OPTION>Mali
										<OPTION>Malta
										<OPTION>Marshall Islands
										<OPTION>Martinique
										<OPTION>Mauritania
										<OPTION>Mauritius
										<OPTION>Mayotte
										<OPTION>Mexico
										<OPTION>Moldova
										<OPTION>Monaco
										<OPTION>Mongolia
										<OPTION>Montserrat
										<OPTION>Morocco
										<OPTION>Mozambique
										<OPTION>Myanmar
										<OPTION>Namibia
										<OPTION>Nauru
										<OPTION>Nepal
										<OPTION>Netherlands
										<OPTION>Netherlands Antilles
										<OPTION>New Caledonia
										<OPTION>New Zealand
										<OPTION>Nicaragua
										<OPTION>Niger
										<OPTION>Nigeria
										<OPTION>Niue
										<OPTION>Norfolk Island
										<OPTION>North Korea
										<OPTION>Northern Mariana Islands
										<OPTION>Norway
										<OPTION>Oman
										<OPTION>Pakistan
										<OPTION>Palau
										<OPTION>Palestinian Territories
										<OPTION>Panama
										<OPTION>Papua New Guinea
										<OPTION>Paraguay
										<OPTION>Peru
										<OPTION>Philippines
										<OPTION>Pitcairn Islands
										<OPTION>Poland
										<OPTION>Portugal
										<OPTION>Puerto Rico
										<OPTION>Qatar
										<OPTION>Reunion
										<OPTION>Romania
										<OPTION>Russia
										<OPTION>Rwanda
										<OPTION>Saint Helena and Dependencies
										<OPTION>Saint Kitts and Nevis
										<OPTION>Saint Lucia
										<OPTION>Saint Pierre and Miquelon
										<OPTION>Saint Vincent and the Grenadines
										<OPTION>Samoa
										<OPTION>San Marino
										<OPTION>Sao Tome and Principe
										<OPTION>Saudi Arabia
										<OPTION>Senegal
										<OPTION>Seychelles
										<OPTION>Sierra Leone
										<OPTION>Singapore
										<OPTION>Slovakia
										<OPTION>Slovenia
										<OPTION>Solomon Islands
										<OPTION>Somalia
										<OPTION>South Africa
										<OPTION>South Georgia and South Sandwich Islands
										<OPTION>South Korea
										<OPTION>Spain
										<OPTION>Spratly Islands
										<OPTION>Sri Lanka
										<OPTION>Sudan
										<OPTION>Suriname
										<OPTION>Svalbard and Jan Mayen
										<OPTION>Swaziland
										<OPTION>Sweden
										<OPTION>Switzerland
										<OPTION>Syria
										<OPTION>Taiwan
										<OPTION>Tajikistan
										<OPTION>Tanzania
										<OPTION>Thailand
										<OPTION>Togo
										<OPTION>Tokelau
										<OPTION>Tonga
										<OPTION>Trinidad and Tobago
										<OPTION>Tunisia
										<OPTION>Turkey
										<OPTION>Turkmenistan
										<OPTION>Turks And Caicos Islands
										<OPTION>Tuvalu
										<OPTION>Uganda
										<OPTION>Ukraine
										<OPTION>United Arab Emirates
										<OPTION>United Kingdom
										<OPTION>United States
										<OPTION>United States Minor Outlying Islands
										<OPTION>Uruguay
										<OPTION>US Virgin Islands
										<OPTION>Uzbekistan
										<OPTION>Vanuatu
										<OPTION>Vatican City
										<OPTION>Venezuela
										<OPTION>Vietnam
										<OPTION>Wallis and Futuna
										<OPTION>Western Sahara
										<OPTION>Yemen
										<OPTION>Zambia
										<OPTION>Zimbabwe
										<OPTION>Serbia
										<OPTION>Montenegro
									</SELECT>
								</p>

								<br /> <br />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<td><input type="hidden" name="action" value="register" /><button
									href="" id="register" class="glyphicon glyphicon-ok  btn btn-primary">&nbsp;Submit </button></td>
					</div>
				</div>
				<!--/.col-md-4-->







				<div class="col-md-4 col-sm-6 wow fadeInDown"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<div class="feature-wrap">
						<legend>
							<br />Picture&nbsp
						</legend>
						<input type="hidden" id="uploadImageValue" name="uploadImageValue"
							value="" /> <img id="uploadPreview" src=img/user.png width="300"
							height="300" /> <br /> <br />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a style="font-size: 20px;" class="glyphicon glyphicon-camera upload-comment-file">&nbsp;Upload image</a>
							<h3>


								
					</div>
					<!--/.col-md-4-->

				</div>
				<!--/.services-->
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#feature-->









	<header id="header">
	<div class="top-bar">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-xs-4">
					<div class="col-sm-6 col-xs-8">
						<div class="social">

							<br /> <br /> <br />

						</div>
					</div>
				</div>
			</div>
			<!--/.container-->
		</div>
		<!--/.top-bar-->


		</form>



		<section id="bottom">
		<div class="container wow fadeInDown" data-wow-duration="1000ms"
			data-wow-delay="600ms">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<br />
						<h3>Company</h3>
						<ul>
							<li><a href="#">About us</a></li>
							<li><a href="#">We are hiring</a></li>
							<li><a href="#">Meet the team</a></li>
							<li><a href="#">Copyright</a></li>
							<li><a href="#">Terms of use</a></li>
							<li><a href="#">Privacy policy</a></li>
							<li><a href="#">Contact us<br /> <br /></a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->

				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<br />
						<h3>Support</h3>
						<ul>
							<li><a href="#">Faq</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Forum</a></li>
							<li><a href="#">Documentation</a></li>
							<li><a href="#">Refund policy</a></li>
							<li><a href="#">Ticket system</a></li>
							<li><a href="#">Billing system</a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->

				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<br />
						<h3>Developers</h3>
						<ul>
							<li><a href="#">Web Development</a></li>
							<li><a href="#">SEO Marketing</a></li>
							<li><a href="#">Theme</a></li>
							<li><a href="#">Development</a></li>
							<li><a href="#">Email Marketing</a></li>
							<li><a href="#">Plugin Development</a></li>
							<li><a href="#">Article Writing</a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->

				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<br />
						<h3>Our Partners</h3>
						<ul>
							<li><a href="#">Adipisicing Elit</a></li>
							<li><a href="#">Eiusmod</a></li>
							<li><a href="#">Tempor</a></li>
							<li><a href="#">Veniam</a></li>
							<li><a href="#">Exercitation</a></li>
							<li><a href="#">Ullamco</a></li>
							<li><a href="#">Laboris</a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->
			</div>
		</div>
		</section>
		<!--/#bottom-->

		<footer id="footer" class="midnight-blue">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					&copy; 2013 <a target="_blank" href="http://shapebootstrap.net/"
						title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>.
					All Rights Reserved.
				</div>
				<div class="col-sm-6">
					<ul class="pull-right">
						<li><a href="#">Home</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Faq</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
				</div>
			</div>
		</div>
		</footer>
		<!--/#footer-->

		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.prettyPhoto.js"></script>
		<script src="js/jquery.isotope.min.js"></script>
		<script src="js/main.js"></script>
		<script src="js/wow.min.js"></script>
		<script src="js/gyanpedia.user.js"></script>
</body>
</html>