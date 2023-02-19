<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label style="width: 40%;margin-left: 10%" class=" col-form-label">Пользователь :</label>
            <input style="width: 40%;margin-right: 10%" type="text" name="username" value="<#if user??>${user.username}</#if>"
                   class="form-control ${(usernameError??)?string('is-invalid', '')}"
                   placeholder="Пользователь" />
            <#if usernameError??>
                <div style="margin-left: 45%" class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class="form-group row">
            <label style="width: 40%;margin-left: 10%" class="col-form-label">Пароль :</label>
            <input style="width: 40%;margin-right: 10%" type="password" name="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Пароль" />
            <#if passwordError??>
                <div style="margin-left: 45%" class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label style="width: 40%;margin-left: 10%" class=" col-form-label">Повторите пароль :</label>
                <input  style="width: 40%;margin-right: 10%" type="password" name="password2"
                        class="form-control ${(password2Error??)?string('is-invalid', '')}"
                        placeholder="Повторите пароль" />
                <#if password2Error??>
                    <div style="margin-left: 45%" class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
            <div class="form-group row">
                <label style="width: 40%;margin-left: 10%" class=" col-form-label">Почта :</label>
                <input  style="width: 40%;margin-right: 10%" type="email" name="email" value="<#if user??>${user.email}</#if>"
                        class="form-control ${(emailError??)?string('is-invalid', '')}"
                        placeholder="Daniil@bonch.com" />
                <#if emailError??>
                    <div style="margin-left: 45%" class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
            <div class="col-sm-6">
                <div style="margin-left: 30%" class="g-recaptcha" data-sitekey="6Le7UdwcAAAAAHImAOGDkRjPH3q977BNjj9-FJuH"></div>

            </div>
            <#if captchaError??>
                <div style="margin-left: 15%;margin-right: 15%;margin-top:  15px" class="alert alert-danger" role="alert">
                    ${captchaError}
                </div>
            </#if>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <#if !isRegisterForm><a style="width: 40%;margin-left: 5%; font-family: 'Comic Sans MS'" href="/registration">Зарегистрироваться</a></#if>
        <button class="btn btn-success" style="width: 30%;float: right;margin-right: 8%;margin-top: 16px" type="submit"><#if isRegisterForm>Создать аккаунт<#else>Войти</#if></button>
    </form>

</#macro>

<#macro logout>
    <form style="margin-right: 10%" action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Выйти из аккаунта!</button>
    </form>
</#macro>