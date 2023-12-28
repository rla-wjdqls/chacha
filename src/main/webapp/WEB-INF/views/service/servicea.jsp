<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FullCalendar with Bootstrap 5 Modal</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <!-- FullCalendar CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />

    <style>
        /* 여기에 추가적인 CSS 스타일을 적용하세요. */
    </style>
</head>
<body>
    <div class="container"><p><a href="/service/serviceList" class="nav-item nav-link"><input type="button" value="글목록" style="width: 10%; height: 30px;"></a></p>
        <div id="calendar"></div>
    </div>

    <!-- Event Modal -->
    <div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalLabel">New Event</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 여기에 이벤트 정보 입력란을 추가하세요. 예: -->
                    <div class="mb-3">
                        <label for="inputTitle" class="form-label">신청시간</label>
                        "${servicea.time}"
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary" onclick="location.href='/service/serviceList'">신청</button>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

    <!-- FullCalendar JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js" crossorigin="anonymous"></script>

    <script>
        // 여기에 JavaScript 코드를 작성하세요.

        // 변수 선언
        var calendar;
        var event;

        // FullCalendar 초기화
        $(document).ready(function () {
            calendar = $('#calendar').fullCalendar({
                // FullCalendar 옵션 설정
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                navLinks: true,
                selectable: true,
                selectHelper: true,
                editable: true,
                eventLimit: true,
					
                // 이벤트 클릭 이벤트 처리
                eventClick: function (calEvent, jsEvent, view) {
                    event = calEvent;
                    $('#inputTitle').val(calEvent.title);
                    $('#eventModalLabel').text('Edit Event');
                    $('#eventModal').modal('show');
                },
                events: [
                    // 서버로부터 가져온 데이터를 이용하여 이벤트 추가
                    // 예시:
                    {
                  	 
                        title: "신청가능한 날짜",
                        start: "${servicea.ssdate}",
                        end: "${servicea.sedate}",
                        
                        // 이미지 URL 등 추가 속성
                    },
                    // 추가적인 이벤트들...
                    
                ],
                // 날짜 클릭 이벤트 처리
                dayClick: function (date, jsEvent, view) {
                    event = null;
                    $('#inputTitle').val('');
                    $('#eventModalLabel').text('신청하시겠습니까?');
                    $('#eventModal').modal('show');
                },
            });
        });

        // 이벤트 생성 및 수정 함수 추가
        function saveEvent() {
            var title = $('#inputTitle').val();

            if (title) {
                var eventData = {
                    title: title,
                    start: event ? event.start : $('#calendar').fullCalendar('getDate'),
                    end: event ? event.end : null,
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