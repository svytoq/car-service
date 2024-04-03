<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">СТО</h1><hr>
    <div style="overflow-y: scroll;
                    height: 400px;">
    <table class="table table-hover table-dark table-striped">
        <thead><tr>
            <th scope="col">Название</th>
            <th scope="col">Номер телефона</th>
             <th scope="col">Работники СТО</th>
            <th scope="col">Удалить СТО</th>
        </tr>
        </thead>
        <tbody>
        <#list stos as sto>
            <tr>
                <td>${sto.name}</td>
                <td>${sto.phone}</td>
                <td>
                                                    <form action="/admin/sto/employees/${sto.id}" method="post">
                                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                        <button type="submit" class="btn btn-light m-3">
                                                            Посмотреть
                                                        </button>
                                                    </form>
                                                </td>
                <td>
                                    <form action="/delete/sto/${sto.id}" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-danger m-3">
                                            Удалить
                                        </button>
                                    </form>
                                </td>
            </tr>
        <#else>
            <h3>Нет СТО</h3>
        </#list>
        </tbody>
    </table></div>
    <h2>Добавить новое СТО</h2>
    <form action="/admin/add/sto" method="post">
            <div id="timeField">
                <hr>
                <label>Название: <input type="text" name="name" required></label>
                <label>Телефон: <input type="text" name="phone" required placeholder="+7**********" pattern="^\+[7]{1}[0-9]{10}$"></label>

            </div>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <br>
            <button id="saveButton3" type="submit" class="btn btn-dark">Сохранить СТО</button>
        </form>
</@t.template>
