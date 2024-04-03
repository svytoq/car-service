<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Назначить инструмент и детали к услуге</h1>
    <hr>
    <div>
        <#list purchase.offers as offer>
            <form action="/admin/add/offer/detail/tool/${offer.id}" method="post">
                <h2 style="text-align: center">Услуга - ${offer.name}</h2><br>
                <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;"><label>Инструменты:
                        <div style="overflow-y: scroll;
            height: 40px;">
                            <#list tools as tool>
                                <div>
                                    <label><input type="checkbox" name="${tool.name}">${tool.name}
                                    </label>
                                </div>
                            </#list>
                        </div>
                    </label>
                    <label>Детали:
                        <div style="overflow-y: scroll;
            height: 40px;">
                            <#list details as detail>
                                <div>
                                    <label><input type="checkbox" name="${detail.id}">${detail.name}
                                        (Цена покупки-${detail.price}₽)
                                    </label>
                                </div>
                            </#list>
                        </div>
                    </label>
                    <input type="hidden" value="${user.id}" name="userId">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-dark m-3">
                        Добавить
                    </button>
                </div>
            </form>
        <#else>
            <h1 style="text-align: center">Ничего не найдено</h1>
        </#list>
    </div>

</@t.template>
