
DROP TABLE IF EXISTS tb_users;

CREATE TABLE tb_users (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	nama VARCHAR ( 125 ) NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP 
);

INSERT INTO 
    tb_users (username, nama, password, email, created_on)
VALUES
    ('ahmad','Ahmad Albab Ibnu Syawal','ahmadpass123', 'ahmad@mock.mail', '2023-11-28 16:30:30'),
    ('karim','Abdul Karim Bin Ayub','pass1234567', 'karim@mock.mail', '2023-11-28 16:31:30'),
    ('kasim','Kassim Baba Bin Jamil','pass1234567', 'kasim@mock.mail', '2023-11-28 16:32:30'),
    ('usop','Yusof Bin Kadarisman','pass1234567', 'usop@mock.mail', '2023-11-28 16:33:30'),
    ('jebat','Badrulhisham Bin Zawawi','pass1234567', 'jebat@mock.mail', '2023-11-28 16:34:30'),
    ('nyamuk','Mahmud Bin Sulaiman','pass1234567', 'nyamuk-aedes@mock.mail', '2023-11-28 15:13:30'),
    ('kawan','Kamarul Bin Azuan','pass1234567', 'kawanku@mock.mail', '2023-11-28 15:28:42'),
    ('kasturi','Damanhuri Bin Rahmat','pass1234567', 'kasturi@mock.mail', '2023-11-28 15:29:08');
