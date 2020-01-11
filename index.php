<!DOCTYPE html>
<html>
<head>
    
	<title>Home Page</title>
	<link rel="stylesheet" type="text/css" href="HomePage.css">
	<link rel="stylesheet" type="text/css" href="header.css">
	<link rel="stylesheet" type="text/css" href="footeri.css">
    <?php 
$pageTitle = 'Home Page';
include('header.php'); ?>
</head>
<body>
	
<div class="stylefinder">
	
<img src="men.png">
	
</div>
<div class="tekst">
	<div class="content">
	<h1>STYLE FINDER</h1>
	<p>Ready to head out to the salon for a restyle? Let our wide ranging collection of trend-led hairstyles and colours inspire you.</p>
		<a href="stylefinder.php">
			<h4>FIND YOUR STYLE</h4>
		</a>
	</div>
	</div>

<div class="clear"></div>
<div class="aboutus">
	<div class="contentleft">
	<div class="sadrzaj">
	<h1>ABOUT US</h1>
	<p>Multi-award winning hairdressing brand with more than 50 years of experience in education, superior client service and haircare expertise.</p>
	<a href="whoweare.php">
		<h4>READ MORE</h4>
	</a>
</div>
</div>
<img src="about.png">
</div>
	<div class="clear"></div>


<div class="location">
	<img src="style.png">
	<div class="content2">
		<div class="content">
	
	<h1>SALON FINDER</h1>
	<p>We have built our legacy on providing clients with precision cuts inspired by our British roots combined with personalized style to fit our clients’ individual needs and lifestyle.</p>
	<a href="contact.php">
		<h4>FIND OUR SALON</h4>
</a>
	</div>
</div>
</div>
<div class="clear"></div>
<?php 
include('footer.php'); ?>
</body>
</html>