-- Active: 1666110835081@@127.0.0.1@3306@SpotifyClone
DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plan(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(45) NOT NULL,
  plan_value DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(70) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    date_signature DATE NOT NULL,
  FOREIGN KEY (plan_id)
    REFERENCES plan (plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(70) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.following(
    -- follow_id INT NOT NULL,
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    -- artist_name VARCHAR(70) NOT NULL,
  CONSTRAINT fk_user_id FOREIGN KEY (user_id)
    REFERENCES users (user_id),
  CONSTRAINT fk_artist_id FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id),
  PRIMARY KEY (user_id, artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    artist_id INT NOT NULL,
  FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(50),
  song_duration INT NOT NULL,
  album_id INT NOT NULL,
  artist_id INT NOT NULL,

  FOREIGN KEY (album_id)
    REFERENCES albums (album_id),
  FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id)
);

CREATE TABLE SpotifyClone.history(
  user_id INT,
  song_id INT,
  history_date DATETIME,
  PRIMARY KEY (user_id, song_id),

  FOREIGN KEY (user_id)
    REFERENCES users (user_id),
  FOREIGN KEY (song_id)
    REFERENCES songs (song_id)
);

INSERT INTO SpotifyClone.plan(plan_id, plan_name, plan_value)
VALUES
  (1, "gratuito", 0.00),
  (2, "universitário", 5.99),
  (3, "pessoal", 6.99),
  (4, "familiar", 7.99);

INSERT INTO SpotifyClone.users(user_id, name, age, plan_id, date_signature)
VALUES
  (1, "Barbara", 82, 1, "2019-10-20"),
  (2, "Robert", 58, 1, "2017-01-06"),
  (3, "Ada", 37, 4, "2017-12-30"),
  (4, "Martin", 46, 4, "2021-08-15"),
  (5, "Sandi", 58, 4, "2017-01-17"),
  (6, "Paulo", 26, 2, "2018-02-14"),
  (7, "Bell", 85, 2, "2018-01-05"),
  (8, "Christopher", 19, 3, "2019-06-05"),
  (9, "Judith", 45, 3, "2020-05-13"),
  (10, "Jorge", 58, 3, "2017-02-17");

INSERT INTO SpotifyClone.artists(artist_id, artist_name)
VALUES
  (1, 'Beyoncé'),
  (2, 'Queen'),
  (3, 'Elis Regina'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (6, 'Nina Simone');

INSERT INTO SpotifyClone.albums (album_id, name, year, artist_id)
VALUES
  (1, 'Renaissance', 2022, 1),
  (2, 'Jazz', 1978, 2),
  (3, 'Hot Space', 1982, 2),
  (4, 'Falso Brilhante', 1998, 3),
  (5,'Vento de Maio', 2001, 3),
  (6, 'QVVJFA?', 2003, 4),
  (7, 'Somewhere Far Beyond', 2007, 5),
  (8, 'I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.songs (song_id, song_name, song_duration, album_id, artist_id)
VALUES
  (1, "BREAKY MY SOUL", 279, 1, 1),
  (2, "VIRGO'S GROOVE", 369, 1, 1),
  (3, "ALIEN SUPER STAR", 116, 1, 1),
  (4, "Don't Stop Me Now", 203, 2, 2),
  (5, "Under Presure", 152, 3, 2),
  (6, "Como Nossos Pais", 105, 4, 3),
  (7, "O Medo de Amar é o Medo de Ser Livre", 207, 5, 3),
  (8, "Samba em Pais", 267, 6, 4),
  (9, "The Bard's Song", 244, 7, 5),
  (10, "Feeling Good", 100, 8, 6);

INSERT INTO SpotifyClone.history(user_id, song_id, history_date)
VALUES
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'), 
(2, 7, '2020-01-02 07:40:33'),
(3, 10, '2020-11-13 16:55:13'), 
(3, 2, '2020-12-05 18:38:30'),
(4, 4, '2021-08-15 17:10:10'), 
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'), 
(6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2012-03-17 14:56:41'),
(10, 3,'2015-12-13 08:30:22');



INSERT INTO SpotifyClone.following (user_id, artist_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);  