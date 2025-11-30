<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="globalLoadingOverlay"
     style="
        position: fixed;
        top: 0; left: 0;
        width: 100vw;
        height: 100vh;
        background: rgba(0,0,0,0.3);
        display: none;
        align-items: center;
        justify-content: center;
        z-index: 999999;
     ">

    <div style="
        background: white;
        padding: 40px 50px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        text-align: center;
        width: 260px;      
    ">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>

        <div class="mt-3" style="font-size: 18px; font-weight: 600; color:#333;">
            Đang xử lý...
        </div>
    </div>
</div>

    