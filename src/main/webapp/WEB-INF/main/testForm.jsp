<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="fileUpload.do" method="post" enctype="multipart/form-data">
	<table border="3">
		<tr>
			<td colspan="2" align="center"><h4>FileUpload Form</h4></td>
		</tr>
		<tr>
			<td>Name :</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>File Name :</td>
			<td><input type="file" name="filename"></td>
		</tr>
		<tr>
			<td>Name :</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>File Name :</td>
			<td><input type="file" name="filename"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"
				value="Upload"></td>
		</tr>
	</table>
</form>