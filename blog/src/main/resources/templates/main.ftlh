<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
    <div style="background: black;height: 1px;margin-top: 20px;margin-left: 10%;margin-right: 10%"><br>
    <div class="form-row">
        <div class="form-group col-md-3">
            <h6>Когда бы вы хотели отправиться? </h6>
            <form method="get" action="/main">
                <div class="form-inline form-control" style="background: lightblue; margin-left: 5%">
                <input style="margin-left: 12px" type="radio" id="contactChoice1"
                       name="filter1" value="зима">
                <label for="contactChoice1"><b>Зима</b></label>
                <input style="margin-left: 12px" type="radio" id="contactChoice1"
                       name="filter1" value="лето">
                <label for="contactChoice1"><b>Лето</b></label>
                <input style="margin-left: 12px" type="radio" id="contactChoice1"
                       name="filter1" value="осень">
                <label for="contactChoice1"><b>Осень</b></label>
                <input style="margin-left: 12px" type="radio" id="contactChoice1"
                       name="filter1" value="весна">
                    <label for="contactChoice1"><b>Весна</b></label>
                </div>
                <h6 style="margin-top: 7px">Где бы вы хотели жить? </h6>
                <div class="form-control form-inline" style="background: lightblue; margin-left: 5%">
                <input style="margin-left: 12px" type="radio" id="contactChoice1"
                       name="filter2" value="отель">
                <label for="contactChoice1"><b>Отель</b></label>
                <input style="margin-left: 12px" type="radio" id="contactChoice1"
                       name="filter2" value="гостиница">
                    <label for="contactChoice1"><b>Гостиница</b></label>
                </div>
                <h6 style="margin-top: 7px">Куда бы вы хотели отправиться? </h6>
                <div class="form-control form-inline" style="background: lightblue; margin-left: 5%">
                    <input style="margin-left: 12px" type="radio" id="contactChoice1"
                           name="filter" value="отель">
                    <label for="contactChoice1"><b>Море</b></label>
                    <input style="margin-left: 12px" type="radio" id="contactChoice1"
                           name="filter" value="гостиница">
                    <label for="contactChoice1"><b>Океан</b></label>
                    <input style="margin-left: 12px" type="radio" id="contactChoice1"
                           name="filter" value="гостиница">
                    <label for="contactChoice1"><b>Природа</b></label>
                    <input style="margin-left: 12px" type="radio" id="contactChoice1"
                           name="filter" value="гостиница">
                    <label for="contactChoice1"><b>Горы</b></label>
                </div>
                <button  style="margin-top: 25px;margin-bottom: 35px;margin-left: 30px" type="submit" class="btn btn-info ml-2 ">Найти</button>
            </form>
        </div>
        <#if isAdmin>
            <a  style="margin-top: 25px;margin-bottom: 260px;margin-left: 80px;margin-right: 20px" class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                Добавить тур
            </a>
            <div class="form-group col-md-7" >
            <div class="collapse <#if message??>show</#if>" id="collapseExample">
                <div class="form-group mt-3">
                    <form method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                                   value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение" />
                            <#if textError??>
                                <div class="invalid-feedback">
                                    ${textError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control"
                                   value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Локация">
                            <#if tagError??>
                                <div class="invalid-feedback">
                                    ${tagError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control"
                                   value="<#if message??>${message.hotel}</#if>" name="hotel" placeholder="Проживание">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control"
                                   value="<#if message??>${message.season}</#if>" name="season" placeholder="Сезон">
                        </div>
                        <div class="form-group">
                            <div class="custom-file">
                                <input type="file" name="file" id="customFile">
                                <label class="custom-file-label" for="customFile">Файл</label>
                            </div>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Добавить</button>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </#if>

    </div>
    <div style="background: black;height: 1px"><div><br>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img style="height: 250px" src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            <i>Сообщений нету</i>
        </#list>
        <div style="height: 120px;width: 100%"></div>
    </div>

    <div style="background: black;height: 1px"><div><br>
    </div>
        <div style="height: 120px;width: 100%"></div>
    </div>
    </div>
    </div>
    </div>


</@c.page>