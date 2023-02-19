<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <div style="background: black;height: 1px;margin-top: 20px;margin-left: 10%;margin-right: 10%">
        <i><b>Добро пожаловать на сайт <strong>Conlion-Travel</strong>! У нас вы сможете найти самые горячие и не дорогие туры.</b></i><br>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="margin-top: 25px;">
            <div class="col" >
                <div class="card shadow-sm" style="background: lightblue">
                    <img  height="300px"  src="https://img-fotki.yandex.ru/get/16146/39544635.1e7/0_904cd_4fd0806b_orig.jpg">
                    <div class="card-body">
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm" style="background: lightblue">
                    <img  height="300px"  src="https://avatars.mds.yandex.net/get-zen_doc/1857554/pub_60e73c0c8eb9a034d826667c_60e746301d503a7bca0a741b/scale_1200">
                    <div class="card-body">
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm" style="background: lightblue">
                    <img  height="300px"  src="https://www.rucasanuova.ru/images/4/0-1404-34844.jpg">
                    <div class="card-body">
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div style="background: black;height: 1px;margin-top: 20px"></div>
        <i><b>Для получения большей информации авторизируйтесь в личном кабинете.</b></i><br><br>
        <button type="button" class="btn btn-info" style="margin-left: 43%"><a class="text-dark" style="font-size: x-large" href="/main">Личный кабинет</a> </button><br>


        <div style="background: black;height: 1px;margin-top: 20px"></div>
        <#if isAdmin>
        <a class="text-dark" href="/greeting/add">Добавить статью</a>
        </#if>

         <#list posts as post>
             <div class="form-control" style="background: lightblue">
             <div class="m-2">
                 <h6>${post.title}</h6>
                 <div style="height: 1px;width: 100%;background: black "></div>
                 <i>${post.anons}</i>
                 <span>${post.full_text}</span>
             </div>
             </div>
             <br>
         </#list>

    </div>



</@c.page>