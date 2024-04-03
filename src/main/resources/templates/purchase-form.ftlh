<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Создать заказ</h1>
    <hr>
    <form action="/user/create/purchase" method="post" id="application">
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <label>Услуга:<div style="overflow-y: scroll;
            height: 40px;">
                    <#list offers as offer>
                        <div>
                            <label><input type="checkbox" name="${offer.name}">${offer.name}
                            </label>
                        </div>
                    </#list>
            </div></label>
            &nbsp &nbsp &nbsp
            <div class="verticalLine"><label> Машина: <select name="car" id="offer-select">
                        <option value="">--Выберите машину--</option>
                        <#list cars as car>
                            <option value="${car.id}">${car.brand} ${car.model}</option>
                        <#else>
                            <h1 style="text-align: center">Ничего не найдено</h1>
                        </#list>
                    </select></label><br>
                <a href="/user/my/cars"> Добавить машину</a>
            </div>
            &nbsp &nbsp &nbsp
            <label>Филиал: <select name="sto" id="offer-select">
                    <option value="">--Выберите СТО--</option>
                    <#list stos as sto>
                        <option value="${sto.name}">${sto.name}</option>
                    <#else>
                        <h1 style="text-align: center">Ничего не найдено</h1>
                    </#list>
                </select></label>


            <input type="hidden" value="${user.email}" name="email">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </div>
        <br>
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <button type="submit" class="btn btn-dark m-3" onclick="toggleTextField()">
                Создать
            </button>
        </div>
    </form>
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
                title: "Спасибо за Ваш заказ!",
                text: "Скоро с вами свяжутся наши сотрудники, чтобы уточнить дату и время!",
                icon: "success",
                timer: 3000,
                showCancelButton: false,
                showConfirmButton: false
            }).then(function () {
                form.submit();
            });

        }

    </script>

</@t.template>
