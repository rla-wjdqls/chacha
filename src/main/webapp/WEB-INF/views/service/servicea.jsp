<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FullCalendar with Bootstrap 5 Modal</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<!-- FullCalendar CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
<!-- 날짜형식 변경 사용 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js"></script>

<!-- jQuery, Popper.js, Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
	crossorigin="anonymous"></script>

<!-- FullCalendar JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"
	crossorigin="anonymous"></script>

<style>
/* 여기에 추가적인 CSS 스타일을 적용하세요. */
</style>

<script>
	function checkDuplicationPerson(applyDate) {
		
		var result = '';
		// 서버에 현재 인원 수를 확인하는 AJAX 요청을 보냅니다.
		var url = '/service/checkDuplicationPerson';
		$.ajax({
			url : url, // 서버의 URL을 지정하세요.
			method : 'POST',
			async : false,
			data : {				
				sno : $("#sno").val()
				,uid : "${loggedInUserId}"
				,applyDate: applyDate
			},
			success : function(response) {
				if(Number(response) > 0) {
					alert("해당 아이디로 신청자가 있습니다");	
					result = false;
				} else {
					result = true;
				}
			},
			error : function() {
				// 오류 처리
				alert('신청 처리 중 오류가 발생했습니다.');
			}
		});
		return result;
	}
</script>
</head>
<body>
	<form method="post" action="/service/servicea" name="calendarForm"
		id="calendarForm">
		<input type="hidden" name="sno" id="sno" value="${servicea.sno}" /> <input
			type="hidden" name="uid" id="uid" value="${servicea.uid}" /> <input
			type="hidden" name="sadate" id="sadate" value="" /> <input
			type="hidden" name="astate" id="astate" value="" />

		<div class="container">
			<p>
				<a href="/service/serviceList" class="nav-item nav-link"> <input
					type="button" value="글목록" style="width: 10%; height: 30px;"></a>
			</p>
			<div id="calendar"></div>
		</div>

		<!-- Event Modal -->
		<div class="modal fade" id="eventModal" tabindex="-1"
			aria-labelledby="eventModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="eventModalLabel">New Event</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 여기에 이벤트 정보 입력란을 추가하세요. 예: -->
						<div class="mb-3">
							<label for="inputTitle" class="form-label">신청날짜 :<span
								id="applyDate"></span></label>
						</div>

						<div class="mb-3">
							<label for="inputTitle" class="form-label">신청시간 :</label>
							${servicea.time}
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="apply();">신청</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		// FullCalendar의 dayClick 이벤트 수정
		// dayClick: function (date, jsEvent, view) {
		// 기존 코드...
		// 신청 버튼 클릭 시, checkAvailableSlotsAndApply 함수 호출
		$('#applyButton').click(function() {
			var selectedDate = moment(date).format('YYYY-MM-DD');
			checkAvailableSlotsAndApply(selectedDate);
		});
		// },

		function apply() {
			$("#calendarForm").submit();
		}
		// 여기에 JavaScript 코드를 작성하세요.

		// 변수 선언
		var calendar;
		var event;

		// FullCalendar 초기화
		$(document).ready(
				function() {
					var startDate = "${servicea.ssdate}";
					var endDate = "${servicea.sedate}";
					var newEndDate = new Date(endDate);
					var lastEndDate = newEndDate.getFullYear() + "-"
							+ ("0" + (newEndDate.getMonth() + 1)).slice(-2)
							+ "-"
							+ ("0" + (newEndDate.getDate() + 1)).slice(-2);

					calendar = $('#calendar').fullCalendar(
							{
								// FullCalendar 옵션 설정
								header : {
									left : 'prev,next today',
									center : 'title',
									right : 'month,agendaWeek,agendaDay'
								},
								navLinks : true,
								selectable : true,
								selectHelper : true,
								editable : true,
								eventLimit : true,

								// 오픈 이벤트
								eventClick : function(calEvent, jsEvent, view) {
									event = calEvent;
									$('#inputTitle').val(calEvent.title);
									$('#eventModalLabel').text('Edit Event');
									$('#eventModal').modal('');
								},
								events : [
								// 서버로부터 가져온 데이터를 이용하여 이벤트 추가
								// 예시:
								{

									title : "신청가능한 날짜",
									start : startDate,
									end : lastEndDate,

								// 이미지 URL 등 추가 속성
								},
								// 추가적인 이벤트들...

								],
								// 날짜 클릭 이벤트 처리 
								dayClick : function(date, jsEvent, view) {
									var clickDate = new Date(date);
									var applyDate = moment(clickDate).format(
											'YYYY-MM-DD');
									var _applyDate = new Date(applyDate);
									$("#sadate").val(applyDate);

									//신청날짜확인 붙이기
									$("#applyDate").text(applyDate);

									var _startDate = new Date(moment(startDate)
											.format('YYYY-MM-DD'));
									var _lastEndDate = new Date(moment(
											lastEndDate).format('YYYY-MM-DD'));
									var currentDate = new Date();
									var _currentDate = new Date(moment(
											currentDate).format('YYYY-MM-DD'));

									// 날짜 비교 제약조건
									// 오늘 기준 조건이 여기 없네
									//클릭날짜는 시작날짜이상이거나 종료날찌 이하신청가능 여기에다가 오늘기준날짜 조건 추가
									//시간지 계산되니까 년월일만 비교해야지
									//년월일 만 출력하는 date 내장함수 사용 포맷형식 년월일만  .toLocaleDateString()
									if (_applyDate >= _startDate
											&& _applyDate < _lastEndDate) {
										//원래 기본조건 맞고 거기에다가 오늘날짜 기준 선택을 조건 하나 더 추가해줘야함. 같이 하니까 로직이 헷갈려서  위에꺼는 통과그리고 그 다음조건에서 비교
										if (_applyDate >= _currentDate) {
											
											//여기에 체크로직 추가 날짜안에 되었어도 신청이 안되게
											if(checkDuplicationPerson(applyDate)) {
												$('#inputTitle').val('');
												$('#eventModalLabel').text(
														'신청하시겠습니까?');
												$('#eventModal').modal('show');	
											}
										} else {
											alert('선택된 날짜는 기간이 지나서 신청이 안됩니다.');
										}
									} else {
										// 범위 밖의 날짜 클릭 시 메시지 표시 또는 다른 처리
										alert('선택된 날짜는 신청 가능한 범위가 아닙니다.');
									}
								},

							});
				});

		// 이벤트 생성 및 수정 함수 추가
		function saveEvent() {
			var title = $('#inputTitle').val();

			if (title) {
				var eventData = {
					title : title,
					start : event ? event.start : $('#calendar').fullCalendar(
							'getDate'),
					end : event ? event.end : null,
				};

				if (event) {
					// 이벤트 수정
					event.title = title;
					$('#calendar').fullCalendar('updateEvent', event);
				} else {
					// 이벤트 생성 
					$('#calendar').fullCalendar('renderEvent', eventData, true);
				}
				$('#eventModal').modal('hide');
			} else {
				alert('Title is required');
			}
		}
	</script>

</body>
</html>