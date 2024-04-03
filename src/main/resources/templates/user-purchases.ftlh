<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои заказы</h1>
    <hr>
    <table class="table table-hover table-dark table-striped">
        <thead>
        <tr>
            <th scope="col">Идентификатор</th>
            <th scope="col">Машина</th>
            <th scope="col">Состояние заказа</th>
            <th scope="col">Услуги</th>
        </tr>
        </thead>
        <tbody>
        <#list purchases as purchase>
            <tr>
                <td>${purchase.id}</td>
                <td>${purchase.car.brand} ${purchase.car.model}</td>
                <td>${purchase.state}</td>

                <td><#list purchase.offers as offer>∘${offer.name}<br></#list></td>
            </tr>
        <#else>
            <h3>Нет заказов</h3>
        </#list>
        </tbody>
    </table>
</@t.template>
