<#import "parts/common.ftlh" as c>

<@c.page>
    <div style="background: black;height: 1px;margin-top: 20px;margin-left: 10%;margin-right: 10%"><br>
        <div class="form-control col-md-4">
        <h5>Редактировать пользователя</h5><br>
    <form action="/user" method="post">
        <i>Пользователь :   </i>
        <input type="text" name="username" value="${user.username}"><br><br>
        <i>Выдать роль :   </i>
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-info" style="float: right">Сохранить</button>
        <div style="clear: both"></div>
    </form>
        </div>
    </div>
</@c.page>