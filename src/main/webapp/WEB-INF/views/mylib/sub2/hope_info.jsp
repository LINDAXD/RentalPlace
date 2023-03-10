<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의도서관 > 희망도서신청 > 희망도서신청정보</title>
<link rel="stylesheet" href="/resources/css/mylib/sub2/hope_info.css">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>

    <div class="header">
    <jsp:include page="../../header.jsp"></jsp:include>
    </div>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>희망도서신청정보</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="" style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/mylib/mypage">나의도서관</a>
                        </li>
                        <li>
                            <a href="/mylib/hope">희망도서신청</a>
                        </li>
                        <li>
                            <a href="/mylib/hope-history">희망도서신청내역</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="doc">

                <!-- 왼쪽 사이드바 -->
                <jsp:include page="../lnb.jsp"></jsp:include>

                <!-- 본문 -->
                <div class="content" style="/* border: 1px solid brown; */">

                    <table>
                        <!-- 제목 -->
                        <tr>
                            <th class="first">
                                제목
                            </th>
                            <td class="last">
                                <input class="title_input" autocomplete="off"
                                 value="${hope.book_title }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 저자 -->
                        <tr>
                            <th class="first">
                                저자
                            </th>
                            <td class="last">
                                <input class="author_input" autocomplete="off"
                                 value="${hope.book_author }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 출판사 -->
                        <tr>
                            <th class="first">
                                출판사
                            </th>
                            <td class="last">
                                <input class="publisher_input" autocomplete="off"
                                 value="${hope.book_publisher }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 연도 -->
                        <tr>
                            <th class="first">
                                연도
                            </th>
                            <td class="last">
                                <input class="pubDate_input" autocomplete="off"
                                 value="${hope.book_pubDate }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- ISBN -->
                        <tr>
                            <th class="first">
                                ISBN
                            </th>
                            <td class="last">
                                <input class="isbn_input" autocomplete="off"
                                 value="${hope.book_isbn }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- ISBN -->
                        <tr>
                            <th class="first">
                                비고
                            </th>
                            <td class="last">
                                <input class="note_input" autocomplete="off"
                                 value="${hope.note }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 가격 -->
                        <tr>
                            <th class="first">
                                가격
                            </th>
                            <td class="last">
                                <input class="price_input" autocomplete="off"
                                 value="${hope.book_price }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <c:if test="${not empty hope.cancel_reason }">
                        <tr>
                            <th class="first">
                                취소사유
                            </th>
                            <td class="last">
                                <input class="cancel_input" autocomplete="off"
                                 value="${hope.cancel_reason }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        </c:if>
                        
                        <!-- 상태 -->
                        <tr>
                            <th class="first">
                                상태
                            </th>
                            
							<td class="last">
							<c:if test="${hope.hope_status == 0 }">
                                <input class="status_input" autocomplete="off"
                                 value="처리중" readonly="readonly"> <br>
                            </c:if>
                            
                            <c:if test="${hope.hope_status == -1 }">
                            <input class="status_input" autocomplete="off"
                                 value="취소" readonly="readonly"> <br>
                            </c:if>
                            
                            <c:if test="${hope.hope_status == 1 }">
                            <input class="status_input" autocomplete="off"
                                 value="소장중" readonly="readonly"> <br>
                            </c:if>
                            </td>
                        </tr>
                        
                        <tr>
                            <th class="first">
                                신청일
                            </th>
                            <td class="last">
                                <input class="reg_date_input" autocomplete="off"
                                 value="${hope.hope_reg_date }" readonly="readonly"> <br>
                            </td>
                        </tr>

                    </table>
					<br>
                    
                    <div class="hope_history_wrap">
                    	<form action="/mylib/hope-history" method="get">
                    		<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="type" value="${cri.type }">
							<button class="btn">목록</button>
                    	</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>

    <script>
    
	    $(function(){
	    	$(".sub2").addClass("active");
			$(".submenu7").addClass("active");
		});
		
    </script>

</body>

</html>