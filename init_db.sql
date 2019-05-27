-- Script for database initialization

CREATE TABLE authors(
    id        SERIAL
  , firstname VARCHAR(80)
  , lastname  VARCHAR(80)
  , CONSTRAINT pk_authors PRIMARY KEY (id)
);

CREATE TABLE posts(
    id        SERIAL
  , title     VARCHAR(80) NOT NULL
  , content   TEXT
  , author_id INTEGER NOT NULL
  , CONSTRAINT pk_posts PRIMARY KEY (id)
  , CONSTRAINT fk_posts_author FOREIGN KEY (author_id) REFERENCES authors (id)
);

CREATE TABLE comments(
    id        SERIAL
  , content   TEXT
  , post_id   INTEGER
  , author_id INTEGER NOT NULL
  , CONSTRAINT pk_comments PRIMARY KEY (id)
  , CONSTRAINT fk_comments_post   FOREIGN KEY (post_id)   REFERENCES posts (id)
  , CONSTRAINT fk_comments_author FOREIGN KEY (author_id) REFERENCES authors (id)
);

DO LANGUAGE plpgsql $$
  DECLARE
    nr_authors  INTEGER := 100;
    nr_posts    INTEGER := 500;
    nr_comments INTEGER := 1000;
    author_ids  INTEGER[];
    post_ids    INTEGER[];
  BEGIN
    -- Create Authors
    INSERT INTO authors (id, firstname, lastname) VALUES ( 1, 'Hui', 'Hertzog');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 2, 'Jayson', 'Fairbanks');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 3, 'Alla', 'Orbison');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 4, 'Lacy', 'Nickell');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 5, 'Gwen', 'China');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 6, 'Maritza', 'Coppedge');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 7, 'Abbey', 'Jamerson');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 8, 'Mikel', 'Wierenga');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 9, 'Roberto', 'Riva');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 10, 'Jeniffer', 'Traywick');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 11, 'Sunday', 'Horsey');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 12, 'Somer', 'Falconer');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 13, 'Shaquita', 'Goodspeed');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 14, 'Stephnie', 'Vazques');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 15, 'Delphine', 'Colburn');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 16, 'Jerald', 'Dubreuil');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 17, 'Katie', 'Bearse');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 18, 'Karina', 'Buttram');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 19, 'Frankie', 'Tanouye');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 20, 'Treena', 'Ensey');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 21, 'Un', 'Staples');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 22, 'Mayme', 'Hakala');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 23, 'Shaunda', 'Gusler');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 24, 'Sharilyn', 'Hiller');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 25, 'Marlin', 'Gann');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 26, 'Mellie', 'Delancey');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 27, 'Else', 'Lash');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 28, 'Raymonde', 'Mcnaughton');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 29, 'Milissa', 'Colligan');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 30, 'Eugenie', 'Salcedo');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 31, 'Domitila', 'Camper');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 32, 'Sharell', 'Laskey');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 33, 'Jesenia', 'Whittaker');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 34, 'Meghann', 'Combs');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 35, 'Shalon', 'Souder');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 36, 'Lorrine', 'Draughn');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 37, 'Cinda', 'Braddy');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 38, 'Eilene', 'Taber');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 39, 'Takako', 'Beadles');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 40, 'Chong', 'Pearl');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 41, 'Carolee', 'Whitlow');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 42, 'Bernetta', 'Bothwell');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 43, 'Anette', 'Hille');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 44, 'Monika', 'Westlund');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 45, 'Jacki', 'Sepulveda');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 46, 'Svetlana', 'Elvira');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 47, 'Roscoe', 'Cifaldi');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 48, 'Concetta', 'Ogara');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 49, 'Esmeralda', 'Nappi');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 50, 'Nakita', 'Couto');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 51, 'Delinda', 'Wilmeth');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 52, 'Maryalice', 'Stockbridge');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 53, 'Heriberto', 'Huntsman');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 54, 'Sheryll', 'Somma');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 55, 'Tereasa', 'Cruze');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 56, 'Twanna', 'Lankford');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 57, 'Britt', 'Archie');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 58, 'Terrie', 'Ruple');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 59, 'Alisha', 'Coulson');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 60, 'Felicidad', 'Sawtelle');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 61, 'Chasity', 'Aston');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 62, 'Philip', 'Cowherd');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 63, 'Myrtle', 'Peace');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 64, 'Danilo', 'Hollenbach');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 65, 'Leighann', 'Rayfield');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 66, 'Zaida', 'Asper');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 67, 'Avelina', 'Schooler');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 68, 'Violette', 'Everest');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 69, 'Tifany', 'Messenger');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 70, 'Aletha', 'Suriel');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 71, 'Meggan', 'Gutirrez');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 72, 'Kai', 'Creswell');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 73, 'Elease', 'Crunk');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 74, 'Meagan', 'Bourquin');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 75, 'Latisha', 'Rueda');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 76, 'Leida', 'Flynt');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 77, 'Summer', 'Matthes');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 78, 'Lawanda', 'Wedderburn');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 79, 'Louann', 'Schult');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 80, 'Joette', 'Strange');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 81, 'Nelly', 'Huffstutler');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 82, 'Leatha', 'Lash');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 83, 'Petronila', 'Esperanza');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 84, 'Valda', 'Cogar');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 85, 'Ghislaine', 'Abdalla');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 86, 'Marianna', 'Parise');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 87, 'Roberta', 'Dore');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 88, 'Barney', 'Rapier');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 89, 'Sumiko', 'Geist');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 90, 'Olene', 'Moffat');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 91, 'Floria', 'Sailor');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 92, 'Silas', 'Soden');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 93, 'Letha', 'Bohman');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 94, 'Anastacia', 'Kujawa');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 95, 'Nolan', 'Partlow');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 96, 'Jasper', 'Flury');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 97, 'Charlotte', 'Riera');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 98, 'Ludie', 'Scheffler');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 99, 'Adolph', 'Prahl');
    INSERT INTO authors (id, firstname, lastname) VALUES ( 100, 'Katlyn', 'Dora');

    SELECT ARRAY( SELECT a.n
                  FROM generate_series(1, nr_authors) AS a(n)
             ) INTO author_ids;

    -- Create random Posts
    WITH create_posts
           AS ( INSERT INTO posts(title, content, author_id)
        SELECT md5(random()::TEXT) AS title
             ,      md5(random()::TEXT) AS content
             ,      author_ids[TRUNC(random() * (array_length(author_ids, 1) - 1) + 1)] AS author_id
        FROM   generate_series(1, nr_posts)
        RETURNING id
      )
    SELECT array_agg(id) INTO post_ids
    FROM   create_posts
    ;

    -- Create random Comments
    INSERT INTO comments(content, post_id, author_id)
    SELECT md5(random()::TEXT) AS content
         ,      post_ids[TRUNC(random() * (array_length(post_ids, 1) - 1) + 1)] AS post_id
         ,      author_ids[TRUNC(random() * (array_length(author_ids, 1) - 1) + 1)] AS author_id
    FROM   generate_series(1, nr_comments);
  END;
  $$;


CREATE INDEX fk_idx_posts_author ON posts(author_id);
CREATE INDEX fk_idx_comments_post ON comments(post_id);
CREATE INDEX fk_idx_comments_author ON comments(author_id);

VACUUM FULL ANALYZE authors;
VACUUM FULL ANALYZE posts;
VACUUM FULL ANALYZE comments;
