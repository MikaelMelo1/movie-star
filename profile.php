<?php
  require_once("templates/header.php");

  require_once("models/User.php");
  require_once("dao/UserDAO.php");
  require_once("dao/MovieDAO.php");

  $user = new User();
  $userDao = new UserDao($conn, $BASE_URL);
  $movieDao = new MovieDAO($conn, $BASE_URL);

  $id = filter_input(INPUT_GET, "id");

  if(empty($id)) {

    if(!empty($userData)) {
      $id = $userData->id;
    } else {
      $message->setMessage("Usuário não encontrado!", "error", "index.php");
    } 
  } else {

    $userData = $userDao->findById($id);
    /// se não encontrar
    
    if(!$userData) {
 $message->setMessage("Usuário não encontrado!", "error", "index.php");  
    }
   
  }

  $fullName = $user->getFullName($userData);

  if($userData->image == "") {
    $userData->image = "user.png";
  }

  // filmes adicionados pelo usuário

  $userMoveis = $movieDao->getMoviesByUserId($userData->id);
?>


   <div id="main-container" class="container-fluid">
    <div class="col-md-8 offset-md-2">
      <div class="row profile-container">
        <div class="col-md-12">
          <h1 class="page-title"><?= $fullName ?></h1>

          <div class="profile-image-container" style="background-image: url('<?= $BASE_URL ?>/img/users/<?= $userData->image ?>')"></div>
          <h3 class="about-title">Sobre:</h3>
          <?php if(!empty($userData->bio)) : ?>
            <p class="profile-description"><?= $userData->bio ?></p>
          <?php else : ?>
            <p class="profile-description">Este usuário ainda não escreveu nada sobre si mesmo...</p>
          <?php endif; ?>
        </div>
        <div class="col-md-12 adden-movies-container">
          <h3>Filmes que enviou:</h3>
          <?php foreach($userMoveis as $movie) : ?>
            <?php require("templates/movie_card.php"); ?>
          <?php endforeach; ?>
          <?php if (count($userMoveis) === 0) : ?>
            <p class="empty-list">Este usuário ainda não enviou nenhum filme...</p>
          <?php endif; ?>
            </div>
        </div>
      </div>
    </div>
  </div>
<?php
  require_once("templates/footer.php");
?>