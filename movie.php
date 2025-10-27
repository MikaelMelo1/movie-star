<?php
require_once("templates/header.php");

// verify user authentic
require_once("dao/MovieDAO.php");
require_once("models/Movie.php");


$id = filter_input(INPUT_GET, "id");



$movieDao = new MovieDAO($conn, $BASE_URL);
if(empty($id)) {
  $message->setMessage("O filme não foi encontrado!", "error", "index.php");
} else {
  $movie = $movieDao->findById($id);

  if(!$movie) {
    $message->setMessage("O filme não foi encontrado!", "error", "index.php");
  }

}

// checa se o filme é do user
$userOwnsMovie = false;

if(!empty($userData)) {
  if($userData->id === $movie->users_id) {
    $userOwnsMovie = true;
  }
}
//resgatar as reviews do filme
?>


<div id="main-container" class="container-fluid">
  <div class="row">
    <div class="offset-md-1 col-md-6 movie-container">
    <h1 class="page-title"><?= $movie->title ?></h1>
    <p class="movie-details">
      <span>Duração: <?=$movie->length ?></span>
      <span class="pipe"></span>
      <span><?= $movie->category ?></span>
      <span class="pipe"></span>
      <p><i class="fas fa-star"></i>9</p>
    </p>
  </div>
  </div>
</div>