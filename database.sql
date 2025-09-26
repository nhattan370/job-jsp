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
    created_at VARCHAR(255),
    description VARCHAR(255),
    experience VARCHAR(255),
    quantity INT(11),
    `rank` VARCHAR(255),
    salary VARCHAR(255),
    status INT(11),
    title VARCHAR(255),
    type VARCHAR(255),
    view INT(11),
    category_id INT(11),
    company_id INT(11),
    deadline VARCHAR(255),
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
    created_at VARCHAR(255),
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
INSERT INTO role (id, role_name) VALUES
(1, 'user'),
(2, 'admin'),
(3, 'recruiter');

-- ========================
-- USER
-- ========================
INSERT INTO user (id, address, description, email, full_name, image, password, phone_number, status, role_id) VALUES
(1, 'Hanoi', 'Normal user', 'user1@gmail.com', 'User One', 'user1.png', '123456', '0901000001', 1, 1),
(2, 'Hanoi', 'Normal user', 'user2@gmail.com', 'User Two', 'user2.png', '123456', '0901000002', 1, 1),
(3, 'Hanoi', 'Normal user', 'user3@gmail.com', 'User Three', 'user3.png', '123456', '0901000003', 1, 1),
(4, 'Hanoi', 'Normal user', 'user4@gmail.com', 'User Four', 'user4.png', '123456', '0901000004', 1, 1),
(5, 'Hanoi', 'Normal user', 'user5@gmail.com', 'User Five', 'user5.png', '123456', '0901000005', 1, 1),
(6, 'Hanoi', 'Normal user', 'user6@gmail.com', 'User Six', 'user6.png', '123456', '0901000006', 1, 1),
(7, 'Hanoi', 'Normal user', 'user7@gmail.com', 'User Seven', 'user7.png', '123456', '0901000007', 1, 1),
(8, 'Hanoi', 'Normal user', 'user8@gmail.com', 'User Eight', 'user8.png', '123456', '0901000008', 1, 1),
(9, 'Hanoi', 'Normal user', 'user9@gmail.com', 'User Nine', 'user9.png', '123456', '0901000009', 1, 1),
(10, 'Hanoi', 'Normal user', 'user10@gmail.com', 'User Ten', 'user10.png', '123456', '0901000010', 1, 1),
(11, 'Hanoi', 'Normal user', 'user11@gmail.com', 'User Eleven', 'user11.png', '123456', '0901000011', 1, 1),
(12, 'Hanoi', 'Normal user', 'user12@gmail.com', 'User Twelve', 'user12.png', '123456', '0901000012', 1, 1),
(13, 'Hanoi', 'Normal user', 'user13@gmail.com', 'User Thirteen', 'user13.png', '123456', '0901000013', 1, 1),
(14, 'Hanoi', 'Normal user', 'user14@gmail.com', 'User Fourteen', 'user14.png', '123456', '0901000014', 1, 1),
(15, 'Hanoi', 'System admin', 'admin@gmail.com', 'Admin User', 'admin.png', 'admin123', '0901000099', 1, 2),
(16, 'HCM', 'Recruiter', 'recruiter1@gmail.com', 'Recruiter One', 'rec1.png', '123456', '0902000001', 1, 3),
(17, 'HCM', 'Recruiter', 'recruiter2@gmail.com', 'Recruiter Two', 'rec2.png', '123456', '0902000002', 1, 3),
(18, 'HCM', 'Recruiter', 'recruiter3@gmail.com', 'Recruiter Three', 'rec3.png', '123456', '0902000003', 1, 3),
(19, 'HCM', 'Recruiter', 'recruiter4@gmail.com', 'Recruiter Four', 'rec4.png', '123456', '0902000004', 1, 3),
(20, 'HCM', 'Recruiter', 'recruiter5@gmail.com', 'Recruiter Five', 'rec5.png', '123456', '0902000005', 1, 3);

-- ========================
-- CV (14 cho user)
-- ========================
INSERT INTO cv (id, file_name, user_id) VALUES
(1, 'cv_user1.pdf', 1),
(2, 'cv_user2.pdf', 2),
(3, 'cv_user3.pdf', 3),
(4, 'cv_user4.pdf', 4),
(5, 'cv_user5.pdf', 5),
(6, 'cv_user6.pdf', 6),
(7, 'cv_user7.pdf', 7),
(8, 'cv_user8.pdf', 8),
(9, 'cv_user9.pdf', 9),
(10, 'cv_user10.pdf', 10),
(11, 'cv_user11.pdf', 11),
(12, 'cv_user12.pdf', 12),
(13, 'cv_user13.pdf', 13),
(14, 'cv_user14.pdf', 14);

-- ========================
-- COMPANY (5 recruiter)
-- ========================
INSERT INTO company (id, address, description, email, logo, name_company, phone_number, status, user_id) VALUES
(1, 'HCM', 'Software outsourcing', 'hr@comp1.com', 'logo1.png', 'TechOne', '0903000001', 1, 16),
(2, 'HCM', 'Mobile development', 'hr@comp2.com', 'logo2.png', 'AppWorks', '0903000002', 1, 17),
(3, 'HCM', 'Game studio', 'hr@comp3.com', 'logo3.png', 'GameHub', '0903000003', 1, 18),
(4, 'HCM', 'E-commerce platform', 'hr@comp4.com', 'logo4.png', 'ShopOnline', '0903000004', 1, 19),
(5, 'HCM', 'AI & Data company', 'hr@comp5.com', 'logo5.png', 'DataSmart', '0903000005', 1, 20);

-- ========================
-- CATEGORY (20 thiên về lập trình)
-- ========================
INSERT INTO category (id, name, number_choose) VALUES
(1, 'Java Developer', 35),
(2, 'Python Developer', 42),
(3, 'C++ Developer', 18),
(4, 'C# Developer', 22),
(5, 'Frontend Developer', 40),
(6, 'Backend Developer', 38),
(7, 'Fullstack Developer', 27),
(8, 'Mobile Developer (Android)', 25),
(9, 'Mobile Developer (iOS)', 20),
(10, 'Web Developer', 45),
(11, 'DevOps Engineer', 15),
(12, 'Data Engineer', 30),
(13, 'Machine Learning Engineer', 28),
(14, 'AI Engineer', 32),
(15, 'Database Administrator', 12),
(16, 'Cloud Engineer', 26),
(17, 'Game Developer', 19),
(18, 'Security Engineer', 14),
(19, 'Software Tester', 21),
(20, 'System Architect', 10);


-- ========================
-- RECRUITMENT (13 job postings từ 5 company)
-- ========================
INSERT INTO recruitment (id, address, created_at, description, experience, quantity, `rank`, salary, status, title, type, view, category_id, company_id, deadline) VALUES
(1, 'HCM', '2025-09-01', 'Backend Java Spring', '2 years', 2, 'Junior', '1000$', 1, 'Java Backend Dev', 'Full-time', 0, 1, 1, '2025-10-01'),
(2, 'HCM', '2025-09-02', 'Python Data Engineer', '3 years', 1, 'Mid', '1500$', 1, 'Python Data Engineer', 'Full-time', 0, 2, 1, '2025-10-05'),
(3, 'HCM', '2025-09-03', 'Frontend ReactJS', '1 year', 2, 'Junior', '900$', 1, 'ReactJS Dev', 'Full-time', 0, 5, 2, '2025-10-03'),
(4, 'HCM', '2025-09-04', 'iOS Mobile Dev', '2 years', 1, 'Senior', '2000$', 1, 'iOS Dev', 'Full-time', 0, 9, 2, '2025-10-07'),
(5, 'HCM', '2025-09-05', 'Unity Game Dev', '1 year', 3, 'Junior', '1200$', 1, 'Game Developer', 'Full-time', 0, 17, 3, '2025-10-10'),
(6, 'HCM', '2025-09-06', 'Unreal Game Dev', '2 years', 2, 'Mid', '1800$', 1, 'Game Developer', 'Full-time', 0, 17, 3, '2025-10-15'),
(7, 'HCM', '2025-09-07', 'E-commerce Backend', '2 years', 2, 'Mid', '1300$', 1, 'Backend Dev', 'Full-time', 0, 6, 4, '2025-10-12'),
(8, 'HCM', '2025-09-08', 'Frontend VueJS', '1 year', 2, 'Junior', '1000$', 1, 'VueJS Dev', 'Full-time', 0, 5, 4, '2025-10-18'),
(9, 'HCM', '2025-09-09', 'Data Scientist', '3 years', 1, 'Senior', '2500$', 1, 'ML Engineer', 'Full-time', 0, 13, 5, '2025-10-20'),
(10, 'HCM', '2025-09-10', 'AI Researcher', '5 years', 1, 'Senior', '3000$', 1, 'AI Engineer', 'Full-time', 0, 14, 5, '2025-10-25'),
(11, 'HCM', '2025-09-11', 'DevOps Engineer', '2 years', 2, 'Mid', '1500$', 1, 'DevOps Engineer', 'Full-time', 0, 11, 1, '2025-10-22'),
(12, 'HCM', '2025-09-12', 'Database Admin', '3 years', 1, 'Mid', '1600$', 1, 'DBA', 'Full-time', 0, 15, 2, '2025-10-28'),
(13, 'HCM', '2025-09-13', 'Cloud Engineer', '2 years', 2, 'Mid', '1800$', 1, 'Cloud Engineer', 'Full-time', 0, 16, 5, '2025-10-30');

-- ========================
-- SAVE_JOB (7 lưu việc)
-- ========================
INSERT INTO save_job (id, recruitment_id, user_id) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 5, 3),
(4, 7, 4),
(5, 9, 5),
(6, 10, 6),
(7, 13, 7);

-- ========================
-- FOLLOW_COMPANY (5 follow)
-- ========================
INSERT INTO follow_company (id, company_id, user_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- ========================
-- APPLYPOST (20 ứng tuyển)
-- ========================
INSERT INTO applypost (id, created_at, recruitment_id, user_id, name_cv, status, text) VALUES
(1, '2025-09-01', 1, 1, 'cv_user1.pdf', 1, 'Ứng tuyển backend Java'),
(2, '2025-09-01', 2, 2, 'cv_user2.pdf', 1, 'Ứng tuyển Python'),
(3, '2025-09-02', 3, 3, 'cv_user3.pdf', 1, 'Ứng tuyển ReactJS'),
(4, '2025-09-02', 4, 4, 'cv_user4.pdf', 1, 'Ứng tuyển iOS'),
(5, '2025-09-03', 5, 5, 'cv_user5.pdf', 1, 'Ứng tuyển Unity'),
(6, '2025-09-03', 6, 6, 'cv_user6.pdf', 1, 'Ứng tuyển Unreal'),
(7, '2025-09-04', 7, 7, 'cv_user7.pdf', 1, 'Ứng tuyển Backend E-com'),
(8, '2025-09-04', 8, 8, 'cv_user8.pdf', 1, 'Ứng tuyển VueJS'),
(9, '2025-09-05', 9, 9, 'cv_user9.pdf', 1, 'Ứng tuyển Data Scientist'),
(10, '2025-09-05', 10, 10, 'cv_user10.pdf', 1, 'Ứng tuyển AI'),
(11, '2025-09-06', 11, 11, 'cv_user11.pdf', 1, 'Ứng tuyển DevOps'),
(12, '2025-09-06', 12, 12, 'cv_user12.pdf', 1, 'Ứng tuyển DBA'),
(13, '2025-09-07', 13, 13, 'cv_user13.pdf', 1, 'Ứng tuyển Cloud'),
(14, '2025-09-07', 1, 14, 'cv_user14.pdf', 1, 'Ứng tuyển Java Backend'),
(15, '2025-09-08', 2, 1, 'cv_user1.pdf', 1, 'Ứng tuyển Data Engineer'),
(16, '2025-09-08', 3, 2, 'cv_user2.pdf', 1, 'Ứng tuyển React'),
(17, '2025-09-09', 4, 3, 'cv_user3.pdf', 1, 'Ứng tuyển iOS'),
(18, '2025-09-09', 5, 4, 'cv_user4.pdf', 1, 'Ứng tuyển Game'),
(19, '2025-09-10', 6, 5, 'cv_user5.pdf', 1, 'Ứng tuyển Game Unreal'),
(20, '2025-09-10', 7, 6, 'cv_user6.pdf', 1, 'Ứng tuyển Backend E-com');
SELECT * FROM user;