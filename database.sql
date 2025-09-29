DROP DATABASE IF EXISTS spring_workcv;
CREATE DATABASE spring_workcv;
USE spring_workcv;

-- Bảng role
CREATE TABLE role (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL
);

-- Bảng cv
CREATE TABLE cv (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    file_name VARCHAR(255),
    user_id INT(11)
);

-- Bảng user
CREATE TABLE user (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    description VARCHAR(255),
    email VARCHAR(255),
    full_name VARCHAR(255),
    image VARCHAR(255),
    password VARCHAR(128),
    phone_number VARCHAR(255),
    status INT(11),
    role_id INT(11),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

-- Bảng company
CREATE TABLE company (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    description TEXT,
    email VARCHAR(255),
    logo VARCHAR(255),
    name_company VARCHAR(255),
    phone_number VARCHAR(255),
    status INT(11),
    user_id INT(11),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Bảng category
CREATE TABLE category (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    number_choose INT(11)
);

-- Bảng recruitment
CREATE TABLE recruitment (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    created_at DATETIME,
    description VARCHAR(255),
    experience VARCHAR(255),
    quantity INT(11),
    `rank` VARCHAR(255),
    salary VARCHAR(255),
    status INT(11),
    title VARCHAR(255),
    type VARCHAR(255),
    views INT(11),
    category_id INT(11),
    company_id INT(11),
    deadline DATE,
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

-- Bảng save_job
CREATE TABLE save_job (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    recruitment_id INT(11),
    user_id INT(11),
    FOREIGN KEY (recruitment_id) REFERENCES recruitment(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Bảng follow_company
CREATE TABLE follow_company (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    company_id INT(11),
    user_id INT(11),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Bảng applypost
CREATE TABLE applypost (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME,
    recruitment_id INT(11),
    user_id INT(11),
    name_cv VARCHAR(255),
    status INT(11),
    text VARCHAR(255),
    FOREIGN KEY (recruitment_id) REFERENCES recruitment(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);
-- ========================
-- ROLE
-- ========================
INSERT INTO role (role_name) VALUES
('user'),
('admin'),
('recruiter');

-- ========================
-- USER
-- ========================
INSERT INTO user (address, description, email, full_name, image, password, phone_number, status, role_id) VALUES
('Hanoi', 'Normal user', 'user1@gmail.com', 'User One', 'user1.png', '123456', '0901000001', 1, 1),
('Hanoi', 'Normal user', 'user2@gmail.com', 'User Two', 'user2.png', '123456', '0901000002', 1, 1),
('Hanoi', 'Normal user', 'user3@gmail.com', 'User Three', 'user3.png', '123456', '0901000003', 1, 1),
('Hanoi', 'Normal user', 'user4@gmail.com', 'User Four', 'user4.png', '123456', '0901000004', 1, 1),
('Hanoi', 'Normal user', 'user5@gmail.com', 'User Five', 'user5.png', '123456', '0901000005', 1, 1),
('Hanoi', 'Normal user', 'user6@gmail.com', 'User Six', 'user6.png', '123456', '0901000006', 1, 1),
('Hanoi', 'Normal user', 'user7@gmail.com', 'User Seven', 'user7.png', '123456', '0901000007', 1, 1),
('Hanoi', 'Normal user', 'user8@gmail.com', 'User Eight', 'user8.png', '123456', '0901000008', 1, 1),
('Hanoi', 'Normal user', 'user9@gmail.com', 'User Nine', 'user9.png', '123456', '0901000009', 1, 1),
('Hanoi', 'Normal user', 'user10@gmail.com', 'User Ten', 'user10.png', '123456', '0901000010', 1, 1),
('Hanoi', 'Normal user', 'user11@gmail.com', 'User Eleven', 'user11.png', '123456', '0901000011', 1, 1),
('Hanoi', 'Normal user', 'user12@gmail.com', 'User Twelve', 'user12.png', '123456', '0901000012', 1, 1),
('Hanoi', 'Normal user', 'user13@gmail.com', 'User Thirteen', 'user13.png', '123456', '0901000013', 1, 1),
('Hanoi', 'Normal user', 'user14@gmail.com', 'User Fourteen', 'user14.png', '123456', '0901000014', 1, 1),
('Hanoi', 'System admin', 'admin@gmail.com', 'Admin User', 'admin.png', 'admin123', '0901000099', 1, 2),
('HCM', 'Recruiter', 'recruiter1@gmail.com', 'Recruiter One', 'rec1.png', '123456', '0902000001', 1, 3),
('HCM', 'Recruiter', 'recruiter2@gmail.com', 'Recruiter Two', 'rec2.png', '123456', '0902000002', 1, 3),
('HCM', 'Recruiter', 'recruiter3@gmail.com', 'Recruiter Three', 'rec3.png', '123456', '0902000003', 1, 3),
('HCM', 'Recruiter', 'recruiter4@gmail.com', 'Recruiter Four', 'rec4.png', '123456', '0902000004', 1, 3),
('HCM', 'Recruiter', 'recruiter5@gmail.com', 'Recruiter Five', 'rec5.png', '123456', '0902000005', 1, 3);

-- ========================
-- CV (14 cho user)
-- ========================
INSERT INTO cv (file_name, user_id) VALUES
('cv_user1.pdf', 1),
('cv_user2.pdf', 2),
('cv_user3.pdf', 3),
('cv_user4.pdf', 4),
('cv_user5.pdf', 5),
('cv_user6.pdf', 6),
('cv_user7.pdf', 7),
('cv_user8.pdf', 8),
('cv_user9.pdf', 9),
('cv_user10.pdf', 10),
('cv_user11.pdf', 11),
('cv_user12.pdf', 12),
('cv_user13.pdf', 13),
('cv_user14.pdf', 14);

-- ========================
-- COMPANY (5 recruiter)
-- ========================
INSERT INTO company (address, description, email, logo, name_company, phone_number, status, user_id) VALUES
('HCM', 'Software outsourcing', 'hr@comp1.com', 'logo1.png', 'TechOne', '0903000001', 1, 16),
('HCM', 'Mobile development', 'hr@comp2.com', 'logo2.png', 'AppWorks', '0903000002', 1, 17),
('HN', 'Game studio', 'hr@comp3.com', 'logo3.png', 'GameHub', '0903000003', 1, 18),
('HCM', 'E-commerce platform', 'hr@comp4.com', 'logo4.png', 'ShopOnline', '0903000004', 1, 19),
('HCM', 'AI & Data company', 'hr@comp5.com', 'logo5.png', 'DataSmart', '0903000005', 1, 20),
('HN', 'Outsources', 'pb@comp5.com', 'logo6.png', 'PhiSmart', '0903007005', 1, 20);

-- ========================
-- CATEGORY (20 thiên về lập trình)
-- ========================
INSERT INTO category (name, number_choose) VALUES
('Java Developer', 35),
('Python Developer', 42),
('C++ Developer', 18),
('C# Developer', 22),
('Frontend Developer', 40),
('Backend Developer', 38),
('Fullstack Developer', 27),
('Mobile Developer (Android)', 25),
('Mobile Developer (iOS)', 20),
('Web Developer', 45),
('DevOps Engineer', 15),
('Data Engineer', 30),
('Machine Learning Engineer', 28),
('AI Engineer', 32),
('Database Administrator', 12),
('Cloud Engineer', 26),
('Game Developer', 19),
('Security Engineer', 14),
('Software Tester', 21);


-- ========================
-- RECRUITMENT (13 job postings từ 5 company)
-- ========================
INSERT INTO recruitment 
(address, created_at, description, experience, quantity, `rank`, salary, status, title, type, views, category_id, company_id, deadline) 
VALUES
('HCM', '2025-09-01 09:00:00', 'Backend Java Spring', '2 years', 2, 'Junior', '1000$', 1, 'Java Backend Dev', 'Full-time', 0, 1, 1, '2025-10-01'),
('HCM', '2025-09-02 09:00:00', 'Python Data Engineer', '3 years', 1, 'Mid', '1500$', 1, 'Python Data Engineer', 'Full-time', 0, 2, 1, '2025-10-05'),
('HCM', '2025-09-03 09:00:00', 'Frontend ReactJS', '1 year', 2, 'Junior', '900$', 1, 'ReactJS Dev', 'Full-time', 0, 5, 2, '2025-10-03'),
('HCM', '2025-09-04 09:00:00', 'iOS Mobile Dev', '2 years', 1, 'Senior', '2000$', 1, 'iOS Dev', 'Full-time', 0, 9, 3, '2025-10-07'),
('HCM', '2025-09-07 09:00:00', 'E-commerce Backend', '2 years', 2, 'Mid', '1300$', 1, 'Backend Dev', 'Full-time', 0, 6, 4, '2025-10-12'),
('HCM', '2025-09-08 09:00:00', 'Frontend VueJS', '1 year', 2, 'Junior', '1000$', 1, 'VueJS Dev', 'Full-time', 0, 5, 4, '2025-10-18'),
('HCM', '2025-09-09 09:00:00', 'Data Scientist', '3 years', 1, 'Senior', '2500$', 1, 'ML Engineer', 'Full-time', 0, 13, 5, '2025-10-20'),
('HCM', '2025-09-10 09:00:00', 'AI Researcher', '5 years', 1, 'Senior', '3000$', 1, 'AI Engineer', 'Full-time', 0, 14, 5, '2025-10-25'),
('HCM', '2025-09-11 09:00:00', 'DevOps Engineer', '2 years', 2, 'Mid', '1500$', 1, 'DevOps Engineer', 'Full-time', 0, 11, 1, '2025-10-22'),
('HCM', '2025-09-12 09:00:00', 'Database Admin', '3 years', 1, 'Mid', '1600$', 1, 'DBA', 'Full-time', 0, 15, 2, '2025-10-28'),
('HCM', '2025-09-13 09:00:00', 'Cloud Engineer', '2 years', 2, 'Mid', '1800$', 1, 'Cloud Engineer', 'Full-time', 0, 16, 5, '2025-10-30'),
('HN', '2025-09-15 10:30:00', 'Cloudinary', '1.5 years', 2, 'Fresher', '900$', 1, 'Cloudinary', 'Full-time', 0, 16, 5, '2025-10-30');

-- ========================
-- SAVE_JOB (7 lưu việc)
-- ========================
INSERT INTO save_job (recruitment_id, user_id) VALUES
(1, 1),
(3, 2),
(5, 2),
(7, 2),
(9, 7),
(10, 6),
(10, 7);

-- ========================
-- FOLLOW_COMPANY (5 follow)
-- ========================
INSERT INTO follow_company (company_id, user_id) VALUES
(1, 1),
(1, 2),
(3, 3),
(4, 4),
(4, 5);

-- ========================
-- APPLYPOST (20 ứng tuyển)
-- =======================
INSERT INTO applypost (created_at, recruitment_id, user_id, name_cv, status, text) VALUES
('2025-09-01', 1, 1, 'cv_user1.pdf', 1, 'Ứng tuyển backend Java'),
('2025-09-01', 1, 2, 'cv_user2.pdf', 1, 'Ứng tuyển Python'),
('2025-09-02', 3, 3, 'cv_user3.pdf', 1, 'Ứng tuyển ReactJS'),
('2025-09-03', 5, 5, 'cv_user5.pdf', 1, 'Ứng tuyển Unity'),
('2025-09-03', 6, 6, 'cv_user6.pdf', 1, 'Ứng tuyển Unreal'),
('2025-09-04', 7, 7, 'cv_user7.pdf', 1, 'Ứng tuyển Backend E-com'),
('2025-09-05', 9, 9, 'cv_user9.pdf', 1, 'Ứng tuyển Data Scientist'),
('2025-09-05', 10, 10, 'cv_user10.pdf', 1, 'Ứng tuyển AI'),
('2025-09-06', 11, 11, 'cv_user11.pdf', 1, 'Ứng tuyển DevOps'),
('2025-09-06', 12, 12, 'cv_user12.pdf', 1, 'Ứng tuyển DBA'),
('2025-09-07', 1, 14, 'cv_user14.pdf', 1, 'Ứng tuyển Java Backend'),
('2025-09-08', 2, 1, 'cv_user1.pdf', 1, 'Ứng tuyển Data Engineer'),
('2025-09-08', 3, 2, 'cv_user2.pdf', 1, 'Ứng tuyển React'),
('2025-09-09', 5, 4, 'cv_user4.pdf', 1, 'Ứng tuyển Game'),
('2025-09-10', 6, 5, 'cv_user5.pdf', 1, 'Ứng tuyển Game Unreal'),
('2025-09-10', 7, 6, 'cv_user6.pdf', 1, 'Ứng tuyển Backend E-com');

SELECT c.id, c.name_company, r.id, r.title, r.type, r.address
FROM company c
LEFT JOIN recruitment r ON r.company_id = c.id
LEFT JOIN applypost a ON r.id = a.recruitment_id
GROUP BY c.id, c.name_company, r.id, r.title, r.type, r.address
ORDER BY COUNT(*) DESC
LIMIT 2 OFFSET 0;

SELECT c.id, c.name_company, c.logo,
       COUNT(DISTINCT r.id) AS total_recruitments
FROM company c
LEFT JOIN recruitment r ON r.company_id = c.id
LEFT JOIN applypost a ON r.id = a.recruitment_id
GROUP BY c.id, c.name_company, c.logo
ORDER BY COUNT(a.id) DESC
LIMIT 1 OFFSET 0;