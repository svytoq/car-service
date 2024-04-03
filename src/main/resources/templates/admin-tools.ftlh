<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Инструменты на складе</h1>
    <hr>
    <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
        <a href="/admin/tools">Все инструменты</a>&nbsp &nbsp &nbsp
        <a href="/admin/available/tools">Доступные инструменты</a>&nbsp &nbsp &nbsp
        <a href="/admin/unavailable/tools">Закончившиеся инструменты</a></div>
    <div style="overflow-y: scroll;
                    height: 400px;">
        <table class="table table-hover table-dark table-striped">
            <thead>
            <tr>
                <th scope="col">Название</th>
                <th scope="col">Количество</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <#list tools as tool>
                <tr>
                    <td>${tool.name}</td>
                    <td>${tool.stock}</td>
                    <td>
                        <form action="/admin/delete/tool/${tool.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </td>
                </tr>
            <#else>
                <h3>Нет инструментов</h3>
            </#list>
            </tbody>
        </table>
    </div>
    <hr>
    <h2>Добавить новый инструмент</h2>
    <form action="/admin/add/tool" method="post">
        <hr>
        <div>
            <label>Введите название: <input type="text" name="name" required></label>
            <label>Введите количество: <input type="number" name="stock" required></label>
        </div>
        <br>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button id="saveButton" type="submit" class="btn btn-dark">Добавить</button>
    </form>
    <hr>
    <h2>Увеличить количество</h2>
    <form action="/admin/fill/tool" method="post">
        <div>
            <label>Инструменты: <select name="name" id="offer-select">
                    <option value="">--Выберите инструмент--</option>
                    <#list tools as tool>
                        <option value="${tool.name}" >${tool.name}</option>
                    <#else>
                        <h1 style="text-align: center">Ничего не найдено</h1>
                    </#list>
                </select></label>
            <label>Введите количество: <input type="number" name="stock" required></label>
        </div>
        <br>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button id="saveButton" type="submit" class="btn btn-dark">Изменить</button>
    </form>
</@t.template>
