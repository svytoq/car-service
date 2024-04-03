<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="koguvcavis-varazdel">
        <div class="sestim-donials">
            <h1 style="text-align: center">Отзывы</h1>
            <div class="sagestim-lonials">
                <div class="vemotau-vokusipol">
                    <#list reviews as review>
                        <div class="testimonial">
                            <div class="gecedanam">Автор отзыва - ${review.user.name} ${review.user.surname}</div>
                            <div class="gecedanam">Оказанные услуги -
                                <#list review.offers as offer>
                                    <b>${offer.name}</b>
                                <#else>
                                    <h3>Нет услуг</h3>
                                </#list>
                            </div>
                            <div class="apogered-gselected">
                                <p>Оценка - ${review.rating}</p>
                            </div>
                            <p>${review.reviewText}</p>
                            <#if user.isAdmin()>
                                <form action="/admin/delete/review/${review.id}" method="post">
                                    <input type="hidden" value="${user.email}" name="email">
                                    <#list review.offers as offer>
                                        <input type="hidden" value="${offer.name}" name="offers">
                                    </#list>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-danger m-3">
                                        Удалить
                                    </button>
                                </form>
                            </#if>
                            <hr>
                        </div>
                    <#else>
                        <h1 style="text-align: center">Ничего не найдено</h1>
                    </#list>
                </div>
            </div>

        </div>
    </div>


</@t.template>
