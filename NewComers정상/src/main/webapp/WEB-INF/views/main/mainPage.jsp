<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>NewComers</title>
  <link href="https://fonts.googleapis.com/css?family=Rubik+Mono+One" rel="stylesheet"><link rel="stylesheet" href="css/mainStyle.css">

</head>
<body>

<!-- partial:index.partial.html -->
<p id="offscreen-text" class="offscreen-text"></p>
<p id="text" class="text"></p>

<svg id="svg">
</svg>

<input type="text" class="input", id="input" />
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/plugins/CSSPlugin.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/easing/EasePack.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenLite.min.js'></script><script  src="js/script.js"></script>
<script>
  document.addEventListener('click',onclick);
function onclick(){
	location.href="main.do"
}
</script>
</body>
</html>
