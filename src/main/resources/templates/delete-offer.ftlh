<#import "blocks/template.ftlh" as t>
<@t.template user>

    <#list offers as offer>
        <div style="display:inline-block; width: 20%; margin-left: 10%">
            <a href="/offer/${offer.id}" class="offer-link">
                <div class="card text-white bg-dark my-3 offer">
                    <div class="card-top">
                        <form action="/offer/delete/${offer.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </div>
                    <img src="/images/${offer.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${offer.name}</h5>
                        <p class="card-text">${offer.price} ₽</p>
                    </div>
                </div>
            </a>
        </div>
    <#else>
        <h1 style="text-align: center">Не найдено</h1>
    </#list>
</@t.template>
