<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Форма распределения</h1>
    <hr>
    <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;"><a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
                                         data-toggle="collapse" href="/admin/add/tool/detail/to/offer/${purchase.id}"
                                         role="button"
                                         aria-expanded="true" aria-controls="collapseExample">
            Добавить инструменты и детали
        </a></div>
    <hr>
    <div>
        <h1 style="text-align: center"><b>Сначала добавьте инструмент и детали к услуге!</b></h1>
        <form action="/admin/allocate/purchase/${purchase.id}" method="post" id="application">
            <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
                <label> Рабочий: <select name="worker" id="offer-select">
                        <option value="">--Выберите рабочего--</option>
                        <#list workers as worker>
                            <option value="${worker.id}">${worker.employee.name} ${worker.employee.surname}-${worker.specialization}</option>
                        <#else>
                            <h1 style="text-align: center">Ничего не найдено</h1>
                        </#list>
                    </select></label>
            </div>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <br>
            <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
                <button type="submit" class="btn btn-dark m-3">
                    Распределить
                </button>
            </div>
        </form>
    </div>


</@t.template>
