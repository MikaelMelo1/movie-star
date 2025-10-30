<?php

class Review
{
  public $id;
  public $users_id;
  public $movie_id;
  public $rating;
  public $review;
}

interface ReviewDAOInterface
{
  public function buildReview($data);
  public function create(Review $review);
  public function getRating($id);
  public function getMovieReviews($movieId);
  public function hasAlreadyReviewed($id, $userId);
}