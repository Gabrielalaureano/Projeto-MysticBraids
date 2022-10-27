DROP DATABASE IF EXISTS mysticbraids;

CREATE DATABASE mysticbraids CHARACTER SET utf8 COLLATE
utf8_general_ci;

USE mysticbraids;

CREATE TABLE users(
uid INT PRIMARY KEY AUTO_INCREMENT,
 date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 name VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL,
 password VARCHAR(255) NOT NULL,
 photo VARCHAR(255),
 birth DATE,
 bio TEXT,
 type ENUM('admin','author','user') DEFAULT 'user',
 last_login DATETIME,
 status ENUM('online','offline','deleted') DEFAULT 'online'
);

    INSERT INTO users( 
        name,
        email, 
        password,
        photo,
        birth,
        bio,
        type
     ) VALUES(
        'Vanessa Soares',
        'Soares@vanessa.com',
        SHA1('342504'),
         'https://randomuser.me/api/portraits/women/72.jpg',
         '1997-08-25',
         'tranças simples porém de um jeito mais formal',
         'author'
     ),(
        'Matias Junior',
        'Junior@Matias',
       SHA1 ('09876'),
       'https://randomuser.me/api/portraits/men/14.jpg',
       '1996-02-14',
       'Modelo,Fotografo',
       'author'

     );
      
      CREATE TABLE articles (
    aid INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    resume VARCHAR(255) NOT NULL,
    status ENUM('online', 'offline', 'deleted') DEFAULT 'online',
    views INT DEFAULT 0,

    FOREIGN KEY (author) REFERENCES users (uid)
      );

      INSERT INTO articles (
        author,
        title,
        content,
        thumbnail,
        resume,
        status
      ) VALUES(
        '1',
        'Ghana Braids',
        '<h2> Titulo teste</h2>em ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam ',
        'https://picsum.photos/200',
        'Ghana braids, as tranças do momento',
        'online'
        
      ),(
        '2',
        'Lemonade braids',
        '<h2>Título de teste</h2><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam ',
        'https://picsum.photos/200',
        'Como torna seu penteado formal',
        'online'

      );

      CREATE TABLE comments (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cauthor INT NOT NULL,
    article INT NOT NULL,
    comment TEXT NOT NULL,
    cstatus ENUM('online', 'offline', 'deleted') DEFAULT 'online',
    FOREIGN KEY (cauthor) REFERENCES users (uid),
    FOREIGN KEY (article) REFERENCES articles (aid)
);
 INSERT INTO comments (
	cauthor,
	comment,
	article
) VALUES(
     '1',
	'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
'2'
),(
'2',
'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
'1'
 );
  CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOt NULL,
    status ENUM('sended', 'readed', 'responded', 'deleted') DEFAULT 'sended'
);