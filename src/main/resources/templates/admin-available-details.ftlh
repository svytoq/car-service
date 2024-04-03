<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Доступные к покупке детали</h1>
    <hr>
    <div style="overflow-y: scroll;
                    height: 400px;">
        <table class="table table-hover table-dark table-striped">
            <thead>
            <tr>
                <th scope="col">Название</th>
                <th scope="col">Количество у поставщиков</th>
                <th scope="col">Поставщик</th>
                <th scope="col">Цена</th>
            </tr>
            </thead>
            <tbody>
            <#list details as detail>
                <tr>
                    <td>${detail.name}</td>
                    <td>${detail.stock}</td>
                    <td><#list detail.providers as provider>
                            ${provider.name}
                        <#else>
                            <h3>Нет поставщиков</h3>
                        </#list>
                    </td>
                    <td>${detail.price}</td>
                </tr>
            <#else>
                <h3>Нет деталей</h3>
            </#list>
            </tbody>
        </table>
    </div>

</@t.template>
