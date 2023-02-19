<#import "parts/common.ftlh" as c>
<@c.page>
<div class="container mt-5">
<form action="/greeting/add" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <input type="text" name="title" placeholder="Введите название статьи" class="form-control">
    <input type="text" name="anons" placeholder="Введите название статьи" class="form-control">
    <textarea  name="full_text" placeholder="Введите название статьи" class="form-control"></textarea>
    <button type="submit" class="btn btn-info">Добавить статью</button>
</form>
</div>

</@c.page>