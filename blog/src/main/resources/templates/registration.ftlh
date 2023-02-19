<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="modal-dialog" style="margin-top: 5%" >
        <div class="modal-content" style="background: lightblue">
            <i><h5 style="margin-top: 10px" class="text-center">Личный кабинет - регистрация</h5></i>
             <div class="modal-body">
                 ${message?if_exists}
                 <@l.login "/registration" true />
            </div>
        </div>
    </div>
</@c.page>