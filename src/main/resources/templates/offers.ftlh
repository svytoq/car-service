<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div>
        <button class="btn btn-outline-dark my-2 my-sm-0" type="button"
                onclick="window.location.href = '/user/reviews'">
            Отзывы
        </button>
    </div>
    <div style=" display: flex;
            height: 20%;width: 100%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;"><#if user.isUser()>
            <button style="width: 70%" class="btn btn-outline-dark my-2 my-sm-0" type="button"
                    onclick="window.location.href = '/user/create/purchase/form'">
                Сделать заказ
            </button>
        </#if>
    </div>
    <br><br>
    <h1 style="text-align: center">Наши услуги</h1>
    <hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> style="width: 100%"
                       class="form-control"
                       id="searchWord">
            </div>
            <br>
            <button style="width: 100%" type="submit" class="btn btn-dark">Найти</button>
        </div>
    </form>
    <hr>
    <#list offers as offer>
        <div style="display:inline-block; width: 20%; margin-left: 10%">
            <a href="/offer/${offer.id}" class="offer-link">
                <div class="card text-white bg-dark my-3 offer">
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
        <h1 style="text-align: center">Ничего не найдено</h1>
    </#list>



</@t.template>
