<!DOCTYPE html>
<html>
<head>
	<?php 
$pageTitle = 'Style Finder';
include('header.php'); ?>
	<link rel="stylesheet" type="text/css" href="stylefinder.css">
	<link rel="stylesheet" type="text/css" href="header.css">
	<link rel="stylesheet" type="text/css" href="footeri.css">
</head>


<body>

	<div id="black">
		<h2>STYLE FINDER</h2>
		<div class="podnaslovi">
			<a href="">LENGTH</a>
	
		<a href="">COLOUR</a>
		<a href="">GENDER</a>
	</div>
	
		</div>
		

	<div class="images2">
	
		<img src="slikaa.jpg" alt="style">
		<img src="pattern.jpg" alt="style">
		<img src="pattern.jpg" alt="style">
		<img src="style2.png" alt="style">
		<div class="centered">
			<h1>FIND YOUR STYLE</h1>
			<p>Every face is unique. Your look is something to be found, not created. Our legendary hair stylists are expertly trained to find your ideal look, highlight your best attributes and personalize your style.</p>
		</div>
	</div>
	<div class="clear"></div>
<main>

		<div class="length" id="duzina">
			<h2>LENGTH</h2>
		<div>
		<img class="images" src="short.jpg"><br>
		SHORT
	</div>
	<div>
		<img class="images" src="mid-length.png"><br>
		MID-LENGTH
	</div>
	<div class="no-margin">
		<img class="images" src="long.jpg"><br>
		LONG
	</div>
</div>
	
	<h2 id="boja">COLOUR</h2>
	<div class="length">
		<div>
		<img class="images" src="red.jpg"><br>
		RED
	</div>
	<div>
		<img class="images" src="blonde.jpg"><br>
		BLONDE
	</div>
	<div class="no-margin">
		<img class="images" src="brunette.jpg"><br>
		BRUNETTE
	</div>
	
</div>


<div class="length gender">
	<h2>GENDER</h2>
	<div>
		<img class="images" id="rod" src="male.jpg"><br>
		MALE
	</div>
	<div class="no-margin">
		<img class="images" src="female.jpg"><br>
		FEMALE
	</div>
</div>

</main>
<?php 
include('footer.php'); ?>

</body>
</html>