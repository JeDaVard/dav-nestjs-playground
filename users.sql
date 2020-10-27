CREATE TABLE users (
    id INT auto_increment PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    created_at TIMESTAMP default NOW(),
    updated_at TIMESTAMP default NOW() ON UPDATE NOW(),
);

CREATE TABLE photos (
    id INT auto_increment PRIMARY KEY,
    image_url varchar(255) not null,
    caption VARCHAR(150) NOT NULL,
    created_at TIMESTAMP default NOW(),
    updated_at TIMESTAMP default NOW() ON UPDATE NOW(),
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE comments (
    id INT auto_increment PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    created_at TIMESTAMP default NOW(),
    updated_at TIMESTAMP default NOW() ON UPDATE NOW(),
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (photo_id) REFERENCES photos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tags (
    id INT auto_increment PRIMARY KEY,
    tag VARCHAR(150) NOT NULL,
    created_at TIMESTAMP default NOW(),
    updated_at TIMESTAMP default NOW() ON UPDATE NOW()
);

CREATE TABLE photo_tags (
    created_at TIMESTAMP default NOW(),
    updated_at TIMESTAMP default NOW() ON UPDATE NOW(),
    tag_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (photo_id) REFERENCES photos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (tag_id, photo_id)
);

CREATE TABLE likes (
    created_at TIMESTAMP default NOW(),
    updated_at TIMESTAMP default NOW() ON UPDATE NOW(),
    photo_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP default NOW(),
    updated_at TIMESTAMP default NOW() ON UPDATE NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (followee_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (follower_id, followee_id)
);