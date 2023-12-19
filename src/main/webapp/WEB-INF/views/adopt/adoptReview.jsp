<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<h3>입양 후기</h3>
<p>
	<a href="adoptForm.jsp">[글쓰기]</a>
</p>

<!-- ====== Cards Section Start -->
<section class="bg-gray-2 dark:bg-dark pt-20 pb-10 lg:pt-[120px] lg:pb-20">
   <div class="container mx-auto">
      <div class="flex flex-wrap -mx-4">
         <!-- Card 1 -->
         <div class="w-full px-4 md:w-1/2 xl:w-1/3">
            <div class="mb-10 overflow-hidden duration-300 bg-white rounded-lg dark:bg-dark-2 shadow-1 hover:shadow-3 dark:shadow-card dark:hover:shadow-3">
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
         </div>
         <!-- Card 2 -->
         <div class="w-full px-4 md:w-1/2 xl:w-1/3">
            <div class="mb-10 overflow-hidden duration-300 bg-white rounded-lg dark:bg-dark-2 shadow-1 hover:shadow-3 dark:shadow-card dark:hover:shadow-3">
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
         <div class="w-full px-4 md:w-1/2 xl:w-1/3">
            <div class="mb-10 overflow-hidden duration-300 bg-white rounded-lg dark:bg-dark-2 shadow-1 hover:shadow-3 dark:shadow-card dark:hover:shadow-3">
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