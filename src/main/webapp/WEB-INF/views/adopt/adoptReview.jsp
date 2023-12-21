<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>
<nav class="navbar navbar-light bg-light" style="height: 42px">
			 <ul class="list-inline ml-auto" style="align-items: center;">
				<li class="list-inline-item">
					<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575" alt="홈으로"></i></a>
					<i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
				</li>
				<li class="list-inline-item">
					<a><span style="color: #757575">반려이야기</span></a>
					<i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
				</li>
				<li class="list-inline-item">
					<a><span style="color: #757575">입양 후기</span></a>
				</li>
			</ul>
		</nav>
<h3>입양 후기</h3>
<p>
	<a href="/adopt/adoptForm">[글쓰기]</a>
</p>

<!-- ====== Cards Section Start -->
		<div class="adoptDe">
              <img src="/img/coco1.jpg" alt="image" class="w-full">
               <div class="p-8 sm:p-9 md:p-7 xl:p-9">
                  <h3>
                     <a href="javascript:void(0)" class="">
                        우리 뽀삐가 이렇게 컸어요~
                     </a>
                  </h3>
                  <p class="text-base leading-relaxed text-body-color dark:text-dark-6 mb-7">
                     뽀삐 자랑글
                  </p>
                  <a href="javascript:void(0)" class="inline-block py-2 text-base font-medium transition border rounded-full text-body-color hover:border-primary hover:bg-primary border-gray-3 px-7 hover:text-white dark:border-dark-3 dark:text-dark-6">
                     자세히 보기
                  </a>
               </div>
            </div>
     
         <!-- Card 2 -->
         <img src="/img/maincatdog2.jpg" alt="image" class="w-full">
               <div class="p-8 sm:p-9 md:p-7 xl:p-9">
                  <h3>
                     <a href="javascript:void(0)" class="">
                        너무 예쁜 내 강쥐
                     </a>
                  </h3>
                  <p class="text-base leading-relaxed text-body-color mb-7">
                     내용
                  </p>
                  <a href="javascript:void(0)" class="inline-block py-2 text-base font-medium transition border rounded-full text-body-color hover:border-primary hover:bg-primary border-gray-3 px-7 hover:text-white dark:border-dark-3 dark:text-dark-6">
                     자세히 보기
                  </a>
               </div>
            </div>
         </div>
         <!-- Card 3 -->
         <img src="/img/maincatdog6.jpg" alt="image" class="w-full">
               <div class="p-8 sm:p-9 md:p-7 xl:p-9">
                  <h3>
                     <a href="javascript:void(0)" class="">
                        소중한 가족이 되었어요~
                     </a>
                  </h3>
                  <p class="text-base leading-relaxed text-body-color mb-7">
                     내용
                  </p>
                  <a href="javascript:void(0)" class="inline-block py-2 text-base font-medium transition border rounded-full text-body-color hover:border-primary hover:bg-primary border-gray-3 px-7 hover:text-white dark:border-dark-3 dark:text-dark-6">
                     자세히 보기
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- Cards Section End -->


<%@ include file="../footer.jsp" %>      