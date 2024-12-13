<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./top.jsp"%>
<main>
	<aside class="left"></aside>
	<section align="center" >
		<div class="center" >
			<h3 align = "center">회원가입</h3>
    <form action="registerDB.jsp" method="post" name="registerForm">
        <fieldset style="border: 0px;">
        <table align="center">
            <tr>
                <th>아이디</th>
                <td><input type="text" name="id" id="id">&nbsp;<input
						type="button" value="중복확인" onClick="idCheck()" /></td>
            </tr>
            <tr>
                <th><label for="pwd">비밀번호</label></th>
                <td><input type="password" name="pwd" id="pwd" placeholder="영문 대문자, 소문자, 숫자 포함 8자 이상" size="31px"></td>
            </tr>
            <tr>
                <th><label for="name">이름</label></th>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <th><label for="phone">전화번호</label></th>
                <td>
                    <input type="text" name="phone1" id="phone1" size="2px">-
                    <input type="text" name="phone2" id="phone2" size="3px">-
                    <input type="text" name="phone3" id="phone3" size="3px">
                </td>
            </tr>
            <tr>
                <th><label for="email1">이메일</label></th>
                <td><input type="text" name="email1" id="email1" size="5px">
                    @
                    <select name="email2" id="email2">
                        <option value="naver">naver.com</option>
                        <option value="gmail">gmail.com</option>
                        <option value="daum">daum.net</option>
                        <option value="other">직접 입력</option>
                    </select>
            </tr>
            <tr>
                <th><label for="zipcode">우편번호</label></th>
                <td><input type="text" name="zipcode" id="zipcode">&nbsp;<input type="button" value="찾기" onClick="zipcodeCheck()" name="button1" id="button1"/></td>
            </tr>
            <tr>
                <th><label for="address1">주소</label></th>
                <td><input type="text" name="address1" id="address1" size="31px"></td>
            </tr>
            <tr>
                <th><label for="address2">상세주소</label></th>
                <td><input type="text" name="address2" id="address2" size="31px"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="button" value="회원가입하기"onClick="inputCheck()"/></td>
            </tr>
        </table>
    </fieldset>
    </form>
		</div>
	</section>
	<aside class="right"></aside>
</main>
<%@ include file="./bottom.jsp"%>
</body>
</html>