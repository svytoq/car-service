<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Детали на складе</h1>
    <hr>
    <div style="overflow-y: scroll;
                    height: 400px;">
        <table class="table table-hover table-dark table-striped">
            <thead>
            <tr>
                <th scope="col">Название</th>
                <th scope="col">Количество</th>
                <th scope="col">Закупочная цена</th>
                <th scope="col">Поставщик</th>

            </tr>
            </thead>
            <tbody>
            <#list details as detail>
                <tr>
                    <td>${detail.name}</td>
                    <td>${detail.storagestock}</td>
                    <td>${detail.price}</td>
                    <td><#list detail.providers as provider>
                            ${provider.name}
                        <#else>
                            <h3>Нет поставщиков</h3>
                        </#list>
                    </td>
                </tr>
            <#else>
                <h3>Нет деталей</h3>
            </#list>
            </tbody>
        </table>
    </div>
    <div>
        <h2 style="text-align: center">Посмотреть какие детали можно купить по количеству</h2>
        <form action="/admin/get/details" method="post">
            <label>Введите количество: <input type="number" name="num" required></label>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-dark m-3">
                Перейти
            </button>
        </form>
    </div>

</@t.template>
