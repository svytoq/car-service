<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поставщики</h1>
    <hr>
    <div style="overflow-y: scroll;
                    height: 400px;">
        <table class="table table-hover table-dark table-striped">
            <thead>
            <tr>
                <th scope="col">Название</th>
                <th scope="col">Контактные данные</th>
                <th scope="col">Доступные детали</th>
                <th scope="col">Удалить поставщика</th>
            </tr>
            </thead>
            <tbody>
            <#list providers as provider>
                <tr>
                    <td>${provider.name}</td>
                    <td>${provider.contact}</td>
                    <td>
                        <form action="/admin/provider/details/${provider.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-light m-3">
                                Посмотреть
                            </button>
                        </form>
                    </td>
                    <td>
                        <form action="/delete/provider/${provider.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </td>
                </tr>
            <#else>
                <h3>Нет поставщиков</h3>
            </#list>
            </tbody>
        </table>
    </div>
    <hr>
    <h2>Добавить нового поставщика</h2>
    <form action="/admin/add/provider" method="post">
        <div id="timeField">
            <label>Название: <input type="text" name="name" required></label>
            <label>Контактные данные: <input type="text" name="contact" required></label>

        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <br>
        <button id="saveButton3" type="submit" class="btn btn-dark">Сохранить поставщика</button>
    </form>
    <hr>
    <h2>Добавить деталь, доступную к покупке</h2>
    <form action="/admin/add/detail/provider" method="post">
        <hr>
        <div>
            <label>Введите название: <input type="text" name="name" required></label>
            <label>Введите количество: <input type="number" name="stock" required></label>
            <label>Введите цену: <input type="number" name="price" required></label>
            <label>Выберите поставщика детали(Одинаковая деталь добавляется к каждому поставщику отдельно):
                    <select name="provider" id="offer-select">
                        <option value="">--Выберите поставщика--</option>
                        <#list providers as provider>
                            <option value="${provider.name}">${provider.name}</option>
                        <#else>
                            <h1 style="text-align: center">Ничего не найдено</h1>
                        </#list>
                    </select>
            </label>
        </div>
        <br>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button id="saveButton" type="submit" class="btn btn-dark">Сохранить деталь</button>
    </form>
</@t.template>
