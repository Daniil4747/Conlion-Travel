<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class=" navbar navbar-expand-lg  " style="background: lightblue">
   <a style="margin-left: 10%;font-family: Mistral;font-size: xx-large" class="m- navbar-brand text-dark" href="/">Conlion-Travel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div style="margin-left: 6%" class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link text-dark" style="font-family: 'Comic Sans MS'" href="/">Главная страница</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-dark" style="font-family: 'Comic Sans MS'"href="/main">Новости</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link text-dark" style="font-family: 'Comic Sans MS'"href="/user">Пользователи</a>
                </li>
            </#if>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link text-dark"style="font-family: 'Comic Sans MS'" href="/user/profile">Профиль</a>
                </li>
            </#if>
        </ul>
        <#if user??>
        <div class="navbar-text mr-3"><strong>${name}</strong></div>
        <@l.logout />
        </#if>
    </div>
</nav>
<div style="width: 100%;height: 3px;background: black;"></div>