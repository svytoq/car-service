<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Нераспределенные заказы</h1>
    <hr>
    <div style="overflow-y: scroll;
                    height: 400px;">
        <table class="table table-hover table-dark table-striped">
            <thead>
            <tr>
                <th scope="col">Идентификатор</th>
                <th scope="col">Машина</th>
                <th scope="col">Состояние заказа</th>
                <th scope="col">Услуги</th>
                <th scope="col"></th>

            </tr>
            </thead>
            <tbody>
            <#list purchases as purchase>
                <tr>
                    <td>${purchase.id}</td>
                    <td>${(purchase.car.brand)!"null"} ${(purchase.car.model)!"null"}</td>
                    <td>${purchase.state}</td>
                    <td><#list purchase.offers as offer>∘${(offer.name)!"null"}<br></#list></td>
                    <td>
                        <form action="/admin/alloc/form/${purchase.id}" method="post">
                            <input type="hidden" value="${user.id}" name="userId">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-outline-light m-3">
                                Распределить
                            </button>
                        </form>
                    </td>
                </tr>
            <#else>
                <h3>Нет заказов</h3>
            </#list>
            </tbody>
        </table>
    </div>
</@t.template>
