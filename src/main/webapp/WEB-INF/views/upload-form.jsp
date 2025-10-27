<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload Test</title>
</head>
<body>
<h2>Test Upload File lên Cloudinary</h2>
<form method="POST" action="upload-test" enctype="multipart/form-data">
    <input type="file" name="file" required />
    <button type="submit">Upload</button>
</form>
</body>
</html>
