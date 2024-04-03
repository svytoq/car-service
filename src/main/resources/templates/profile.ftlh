<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мой аккаунт</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Электронная почта: <b>${user.email}</b>
        <br>
        Номер телефона: <b>${user.phoneNumber}</b>
        <br>
        <br>
        <#if user.isAdmin()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/admin">
                Панель администратора
            </a><br>
        </#if>

        <#if user.isOperator()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/operator/panel">
                Панель оператора
            </a><br>
        </#if>

        <#if user.isWorker()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/worker/panel">
                Панель работника
            </a><br>
            <form action="/worker/add/request" method="post" id="application">
                <h3>Проблемы?</h3>
                <input type="text" name="questionText" required placeholder="Оставь запрос" style="border-radius: 7px;">
                <input type="hidden" value="${user.email}" name="email">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <br><br>
                <button id="saveButton" type="submit" class="btn btn-dark" onclick="toggleTextField()">Отправить
                </button>
                <hr>
            </form>
        </#if>

        <#if user.isUser()>
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
               data-toggle="collapse" href="/user/my/purchases" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Мои заказы
            </a>
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
               data-toggle="collapse" href="/user/my/cars" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Мои автомобили
            </a>
            <form action="/user/add/review" method="post">
                <hr>
                <h3>Оставить отзыв</h3>

                <label>Услуга:
                    <div style="overflow-y: scroll;height: 40px">
                        <#list offers as offer>
                            <div>
                                <label><input type="checkbox" name="${offer.name}">${offer.name}
                                </label>
                            </div>
                        <#else>
                            <h1 style="text-align: center">Ничего не найдено</h1>
                        </#list>
                    </div>
                </label>

                <label>Текст отзыва: <input type="text" name="reviewText" required></label>
                <label>Рейтинг: <input type="number" name="rating" required min="1" max="5"></label>
                <input type="hidden" value="${user.email}" name="email">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <br><br>
                <button id="saveButton" type="submit" class="btn btn-dark">Отправить</button>
                <hr>
            </form>

            <form action="/user/add/question" method="post" id="application">
                <h3>Появился вопрос?</h3>
                <input type="text" name="questionText" required placeholder="Задай его нам" style="border-radius: 7px;">
                <input type="hidden" value="${user.email}" name="email">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <br><br>
                <button id="saveButton" type="submit" class="btn btn-dark" onclick="toggleTextField()">Отправить
                </button>
                <hr>
            </form>
        </#if>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="text-align: center; width: 100%" class="btn btn-danger mb-2">
                Выйти
            </button>
        </form>
    </div>
    <script>
        var form = document.getElementById('application');
        function toggleTextField() {
            form.onsubmit = function (e) {
                e.preventDefault();
                doSomeAnimationHere();
            }
        }

        function doSomeAnimationHere() {
            Swal.fire({
                title: "Спасибо за обращение!",
                text: "Скоро с вами свяжутся наш администратор и поможет решить вопрос!",
                icon: "success",
                timer:3000,
                showCancelButton: false,
                showConfirmButton: false
            }).then(function() {
                form.submit();
            });

        }

    </script>
</@t.template>