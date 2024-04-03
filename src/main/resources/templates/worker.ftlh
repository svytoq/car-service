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
            <th scope="col">Инструменты</th>
            <th scope="col">Детали</th>
            <th scope="col"></th>
            <th scope="col"></th>

        </tr>
        </thead>
        <tbody>
        <#list purchases as purchase>
            <tr>
                <td>${purchase.id}</td>
                <td>${purchase.car.brand} ${purchase.car.model}</td>
                <td>${purchase.state}</td>
                <td><#list purchase.offers as offer>∘${offer.name}<br></#list></td>
                <td><#list purchase.offers as offer>
                        <#list offer.tools as tool>
                            ∘${tool.name}
                            <br></#list>
                    </#list></td>
                <td><#list purchase.offers as offer>
                <#list offer.details as detail>
                    ∘${detail.name}
                    <br></#list>
                </#list></td>
                <td>
                    <form action="/worker/process/${purchase.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <#if purchase.state == "Ожидает выполнения">
                            <button type="submit" class="btn btn-light m-3">
                                Начал
                            </button>
                        </#if>
                    </form>
                </td>
                <td>
                    <form action="/worker/done/${purchase.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <#if purchase.state == "В процессе">
                            <button type="submit" class="btn btn-light m-3">
                                Закончил
                            </button>
                        </#if>
                    </form>
                </td>
            </tr>
        <#else>
            <h3>Нет заказов</h3>
        </#list>
        </tbody>
    </table>
</@t.template>
