<#import "parts/common.ftlh" as c>

<@c.page>
    <div style="background: black;height: 1px;margin-top: 20px;margin-left: 10%;margin-right: 10%"><br>
        <div class="form-control col-md-4">
        <i><b style="margin-top: 20px">Список пользователей: </b></i>
    <table class="table mt-3" style="width: 100%" >
        <thead >
        <tr class="text-center">
            <th class="border border-dark" >Имя</th>
            <th class="border border-dark" >Роль</th>
            <th class="border border-dark"></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr class="text-center">
                <td class="border border-dark">${user.username} </td>
                <td class="border border-dark"><#list user.roles as role>${role}<#sep>, </#list></td>
                <td class="border border-dark"><a style="color: indigo" href="/user/${user.id}">Редактировать</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
    </div>
    </div>
</@c.page>