<?php

require_once("globals.php");
require_once("dao/UserDAO.php");
require_once("models/Message.php");
require_once("models/User.php");
require_once("db.php");


$userDao = new UserDAO($conn, $BASE_URL);

$message = new Message($BASE_URL);

$type = filter_input(INPUT_POST, "type");


if($type === "update") {

  $userData = $userDao->verifyToken();

  $name = filter_input(INPUT_POST, "name");
  $lastname = filter_input(INPUT_POST, "lastname");
  $email = filter_input(INPUT_POST, "email");
  $bio = filter_input(INPUT_POST, "bio");

  $user = new User();

  $userData->name = $name;
  $userData->lastname = $lastname;
  $userData->email = $email;
  $userData->bio = $bio;

  // Image upload
  if (isset($_FILES["image"]) && !empty($_FILES["image"]["tmp_name"])) {

    $image = $_FILES["image"];
    $allowedTypes = ["image/jpeg", "image/jpg", "image/png"];

    if (in_array($image["type"], $allowedTypes)) {

      // Ensure upload directory exists
      $uploadDir = __DIR__ . "/img/users/";
      if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
      }

      // Generate a unique filename keeping the original extension
      $ext = pathinfo($image["name"], PATHINFO_EXTENSION);
      $imageName = uniqid("user_", true) . "." . $ext;
      $destination = $uploadDir . $imageName;

      // Move uploaded file to destination
      if (move_uploaded_file($image["tmp_name"], $destination)) {
        $userData->image = $imageName;
      } else {
        $message->setMessage("Falha ao enviar a imagem.", "error", "editprofile.php");
      }

    } else {
      $message->setMessage("Tipo de imagem inválido! (jpg, jpeg ou png)", "error", "editprofile.php");
    }
  }

  // Update user after handling image (if any)
  $userDao->update($userData);

} elseif ($type === "changepassword") {

  $userData = $userDao->verifyToken();

  $password = filter_input(INPUT_POST, "password");
  $confirmpassword = filter_input(INPUT_POST, "confirmpassword");
  $id = filter_input(INPUT_POST, "id");

  if ($password === $confirmpassword) {

    // Create the new password hash
    $finalPassword = $userData->generatePassword($password);

    $userData->password = $finalPassword;

    $userDao->changePassword($userData);

  } else {
    $message->setMessage("As senhas não coincidem!", "error", "editprofile.php");
  }
} else {
  $message->setMessage("Informações inválidas!", "error", "index.php");
}