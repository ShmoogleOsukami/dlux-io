<!doctype html>
<html lang="en" class="h-100">
<head>
<title>DLUX - Create</title>
<?php 
   $path = $_SERVER['DOCUMENT_ROOT'];
   $path .= "/mod/header.php";
   include_once($path);
?>
</head>

<body class="d-flex flex-column h-100 padme-t70">
<?php 
   $path = $_SERVER['DOCUMENT_ROOT'];
   $path .= "/mod/nav.php";
   include_once($path);
?>
<main role="main" class="flex-shrink-0">
  <div class="container">
	  <h1 class="text-center text-white">Build A DLUX App</h1>
	  <div class="card-deck">
		 	  <div class="card border-danger bg-dark my-5">
      <div class="card-body text-center text-white">
    	<h5 class="card-title">360° Gallery</h5>
    	<p class="card-text">Upload 360° images to view in VR</p>
		<hr class="bg-light">
		<center>
		<ul class="text-left">
		<li>App Type: VR</li>
		<li>Builder: 2D drag-and-drop asset upload and publishing form; 3D A-Frame preview</li>
		<li>Difficulty: Easy</li>
		</ul>
		</center>
				  </div>
		  <div class="card-footer text-center">
    	<a href="/new/360-gallery" class="btn btn-danger">Get Started</a>
		  </div>
  	  </div>

		  	  <div class="card border-danger bg-dark my-5">
      <div class="card-body text-center text-white">
    	<h5 class="card-title">360° Tour</h5>
    	<p class="card-text">Upload 360° images to view in VR</p>
		<hr class="bg-light">
		<center>
		<ul class="text-left">
		<li>App Type: VR</li>
		<li>Builder: 2D drag-and-drop asset upload and publishing form; 3D A-Frame preview</li>
		<li>Difficulty: Easy</li>
		</ul>
		</center>
		  </div>
		  <div class="card-footer text-center">
    	<a href="/new/360-tour" class="btn btn-danger disabled">Coming Soon</a>
		  </div>
  	  
	</div>
	  </div>
	<div class="card-deck">
	<div class="card border-danger bg-dark my-5">
      <div class="card-body text-center text-white">
    	<h5 class="card-title">VR BUILDER</h5>
    	<p class="card-text">Remix our boilerplate on Glitch and upload your own images and 3D models</p>
		<hr class="bg-light">
		<center>
		<ul class="text-left">
		<li>App Type: VR</li>
		<li>Builder: 2D drag-and-drop asset upload, code panel, and publishing form; 3D A-Frame inspector</li>
		<li>Difficulty: Intermediate</li>
		</ul>
		</center>
		  </div>
		  <div class="card-footer text-center">
    	<a href="https://dlux-vr.glitch.me/build.html" target="_blank" class="btn btn-danger">Get Started</a>
		  </div>
  	  </div>
	

	<div class="card border-danger bg-dark my-5">
      <div class="card-body text-center text-white">
    	<h5 class="card-title">SUPERCRAFT</h5>
    	<p class="card-text">Use a VR headset to build scenes with your hands, then publish to DLUX</p>
		<hr class="bg-light">
		<center>
		<ul class="text-left">
		<li>App Type: VR</li>
		<li>Builder: VR with Touch Controls, 2D publishing form</li>
		<li>Difficulty: Easy</li>
		</ul>
		</center>
		  </div>
		  <div class="card-footer text-center">
    	<a href="/new/supercraft" class="btn btn-danger">Get Started</a>
		  </div>
  	  </div>
	
	  </div>
		<div class="card-deck">
	<div class="card border-danger bg-dark my-5">
      <div class="card-body text-center text-white">
    	<h5 class="card-title">ADVANCED UPLOADER</h5>
    	<p class="card-text">Upload any HTML5 Single Page App (SPA)</p>
		<hr class="bg-light">
		<center>
		<ul class="text-left">
		<li>App Type: AR/VR/2D</li>
		<li>Builder: 2D publishing form with drag-and-drop support for images</li>
		<li>Difficulty: Easy</li>
		</ul>
		</center>
		  </div>
		  <div class="card-footer text-center">
    	<a href="/new/advanced" class="btn btn-danger">Get Started</a>
		  </div>
  	  </div>
	</div>
			
	</div>
	  </div>
	</main>
<?php 
   $path = $_SERVER['DOCUMENT_ROOT'];
   $path .= "/mod/footer.php";
   include_once($path);
?>
</body></html>
