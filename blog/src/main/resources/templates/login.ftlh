<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>

    <div class="modal-dialog" style="margin-top: 10%" >
        <div class="modal-content" style="background: lightblue">
            <i><h5 style="margin-top: 10px" class="text-center">Личный кабинет - авторизация</h5></i>
            <div class="modal-body">
                <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
                    <div class="alert alert-danger" role="alert">
                        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
                    </div>
                </#if>
                <#if message??>
                    <div class="alert alert-${messageType}" role="alert">
                        ${message}
                    </div>
                </#if>
                <@l.login "/login" false/>
            </div>
     </div>
    </div>

</@c.page>