-- Active: 1666110835081@@127.0.0.1@3306@SpotifyClone
DROP DATABASE SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;


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
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
  CONSTRAINT fk_user_id FOREIGN KEY (user_id)
    REFERENCES users (user_id),
  CONSTRAINT fk_artist_id FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id),
  PRIMARY KEY (user_id, artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    year YEAR NOT NULL,
    artist_id INT NOT NULL,
  FOREIGN KEY (artist_id)
    REFERENCES artists (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(50),
  song_duration INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id)
    REFERENCES SpotifyClone.albums (album_id)
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
  (2, "familiar", 7.99),
  (3, "universitário", 5.99),
  (4, "pessoal", 6.99);

INSERT INTO SpotifyClone.users(name, age, plan_id, date_signature)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.artists(artist_id, artist_name)
VALUES
  (1, 'Beyoncé'),
  (2, 'Queen'),
  (3, 'Elis Regina'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (6, 'Nina Simone');

INSERT INTO SpotifyClone.albums (name, artist_id, year)
VALUES
  ('Renaissance', 1, '2022'),
    ('Jazz', 2, '1978'),
    ('Hot Space', 2, '1982'),
    ('Falso Brilhante', 3, '1998'),
    ('Vento de Maio', 3, '2001'),
    ('QVVJFA?', 4, '2003'),
    ('Somewhere Far Beyond', 5, '2007'),
    ('I Put A Spell On You', 6, '2012');

INSERT INTO SpotifyClone.songs (song_name, album_id, song_duration)
VALUES
  ('BREAK MY SOUL', 1, 279),
    ('VIRGO’S GROOVE', 1, 369),
    ('ALIEN SUPERSTAR', 1, 116),
    ('Don’t Stop Me Now', 2, 203),
    ('Under Pressure', 3, 152),
    ('Como Nossos Pais', 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
    ('Samba em Paris', 6, 267),
    ('The Bard’s Song', 7, 244),
    ('Feeling Good', 8, 100);
INSERT INTO SpotifyClone.history(user_id, song_id, history_date)
VALUES
 (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10,'2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');


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