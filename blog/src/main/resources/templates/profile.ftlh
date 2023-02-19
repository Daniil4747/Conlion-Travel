<#import "parts/common.ftlh" as c>
<@c.page>

    <div style="background: black;height: 1px;margin-top: 20px;margin-left: 10%;margin-right: 10%"><br>
    <div class="form-control col-md-5">
        <h5 style="margin-top: 20px">Пользователь : ${username}</h5>
        ${message?if_exists}
    <form method="post">
        <div style="margin-top: 20px" class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль :</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Пароль" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email :</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}" />
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" style="float: right" type="submit">Сохранить</button>
        <div style="clear: both"></div>
    </form>
    </div>
    </div>

</@c.page>