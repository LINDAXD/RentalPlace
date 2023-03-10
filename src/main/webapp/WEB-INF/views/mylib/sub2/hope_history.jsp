<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의도서관 > 희망도서신청 > 희망도서신청내역</title>
<link rel="stylesheet" href="/resources/css/mylib/sub2/hope_history.css">
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
                    <h3>희망도서신청</h3>
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
                <div class="content" style="">
                    <div class="doc">
                        <div class="wrapper-bbs" style="">

                            <!--검색-->
                            <div class="search">
                                <form action="">
                              		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                              		<input type="hidden" name="page" value="1">
                                    <select class="type" name="type" onchange="submit()">
                                    
                                    	<c:if test="${empty pageMaker.cri.type}">
                                    	<option value="all" selected="selected">전체</option>
                                        <option value="process">처리중</option>
                                        <option value="own">소장중</option>
                                        <option value="cancel">취소</option>
                                    	</c:if>
                                    	
                                    	<c:if test="${pageMaker.cri.type == 'all'}">
                                    	<option value="all" selected="selected">전체</option>
                                        <option value="process">처리중</option>
                                        <option value="own">소장중</option>
                                        <option value="cancel">취소</option>
                                    	</c:if>
                                    	
                                    	<c:if test="${pageMaker.cri.type == 'process' }">
                                    	<option value="all">전체</option>
                                        <option value="process" selected="selected">처리중</option>
                                        <option value="own">소장중</option>
                                        <option value="cancel">취소</option>
                                    	</c:if>
                                    	
                                    	<c:if test="${pageMaker.cri.type == 'own' }">
                                    	<option value="all">전체</option>
                                        <option value="process">처리중</option>
                                        <option value="own" selected="selected">소장중</option>
                                        <option value="cancel">취소</option>
                                    	</c:if>
                                    	
                                    	<c:if test="${pageMaker.cri.type == 'cancel' }">
                                    	<option value="all">전체</option>
                                        <option value="process">처리중</option>
                                        <option value="own">소장중</option>
                                        <option value="cancel" selected="selected">취소</option>
                                    	</c:if>
                                        
                                    </select>
                                </form>

                            </div>
                            <!-- 도서 수 -->
                            <div class="inline">
                                <form action="">
                                	
                                    <span style="margin-right: 10px;"> 희망 도서 신청 수 : <b>${total }</b> 건</span>
                                    <select name="amount">
                                    	
	                                    <c:if test="${pageMaker.cri.amount == 10 }">
	                                    <option value="10" selected="selected">10건씩 보기</option>
	                                    <option value="20">20건씩 보기</option>
	                                    <option value="30">30건씩 보기</option>
	                                    <option value="40">40건씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${pageMaker.cri.amount == 20 }">
	                                    <option value="10">10건씩 보기</option>
	                                    <option value="20" selected="selected">20건씩 보기</option>
	                                    <option value="30">30건씩 보기</option>
	                                    <option value="40">40건씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${pageMaker.cri.amount == 30 }">
	                                    <option value="10">10건씩 보기</option>
	                                    <option value="20">20건씩 보기</option>
	                                    <option value="30" selected="selected">30건씩 보기</option>
	                                    <option value="40">40건씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${pageMaker.cri.amount == 40 }">
	                                    <option value="10">10건씩 보기</option>
	                                    <option value="20">20건씩 보기</option>
	                                    <option value="30">30건씩 보기</option>
	                                    <option value="40" selected="selected">40건씩 보기</option>
	                                    </c:if>
                                        
                                    </select>
                                    <input type="hidden" name="page" value="1">
                                    <button id="list_btn" class="btn">이동</button>
                                </form>

                            </div>

                            <!-- 테이블 -->
                            <div class="table-wrap">
                            	<c:if test="${not empty hope_list }">
                                <table  >
                                    <thead>
                                        <tr>
                                            <th style="width: 400px;">도서명</th>
                                            <th style="width: 150px;">저자</th>
                                            <th style="width: 100px;">출판사</th>
                                            <th style="width: 90px;">신청일</th>
                                            <th style="width: 75px;">처리결과</th>
                                            <th style="width: 60px;">정보</th>
	                                </tr>
                                    </thead>
                                    <tbody>
                                    
	                                    <c:forEach var="hope_list" items="${hope_list}">
										<tr>
											<td>${hope_list.book_title }</td>
											<td class="border">${hope_list.book_author }</td>
											<td class="border">${hope_list.book_publisher}</td>
											<td class="border"">${hope_list.hope_reg_date}</td>

											<c:if test="${hope_list.hope_status == 0 }">
											<td class="border"">처리중</td>
											</c:if>
											
											<c:if test="${hope_list.hope_status == -1 }">
											<td class="border"">취소</td>
											</c:if>
											
											<c:if test="${hope_list.hope_status == 1 }">
											<td class="border">소장중</td>
											</c:if>
											
											<td class="border">
												<form action="/mylib/hope-info" method="get">
													<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
													<input type="hidden" name="page" value="${pageMaker.cri.page }">
													<input type="hidden" name="type" value="${pageMaker.cri.type }">
													<input type="hidden" name="hope_no" value="${hope_list.hope_no }">
													<button class="btn2">정보</button>
												</form>
											
											</td>
											
										</tr>
										</c:forEach>
	                                        
                                    </tbody>
                                </table>
                                
                                <br>
                                
                                <div class="pageInfo" style="">
	
									<c:if test="${pageMaker.prev }">
										<a class="not" href="${pageMaker.startPage - 1}">이전</a>
									</c:if>
									
									<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
										<a class="${pageMaker.cri.page == num ? "current":"not" }" href="${num }"><span>${num }</span></a>
									</c:forEach>
									
									<c:if test="${pageMaker.next }">
										<a class="not" href="${pageMaker.endPage + 1}">다음</a>
									</c:if>
								</div>
								</c:if>
                            </div>

                        </div>
						<br><br>
						<c:if test="${empty hope_list }">
							<h2 style="text-align: center;">조회 된 도서가 없습니다.</h2>
						</c:if>
                    </div>

                </div>

            </div>
        </div>
    </div>
    
    <form method="get" class="moveForm"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="page" value="${pageMaker.cri.page }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
    
    <!-- footer -->
    <jsp:include page="../../footer.jsp"></jsp:include>


	<script>
		
		$(function() {
			$(".sub2").addClass("active");
			$(".submenu7").addClass("active");
			
			let moveForm = $(".moveForm");
			
			//pageInfo의 a태그를 누르면 a태그의 href 속성을 가져와서 moveForm의 page에 넣고 moveForm이 submit됨
			$(".pageInfo a").on("click", function(e) {
				e.preventDefault();
				moveForm.find("input[name = 'page']").val($(this).attr("href"));
				moveForm.submit();
			});
			 
		});
		
	</script>	


</body>
</html>