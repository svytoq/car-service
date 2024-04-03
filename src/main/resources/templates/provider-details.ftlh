<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Детали поставщика</h1>
    <hr>
    <table class="table table-hover table-dark table-striped">
        <thead>
        <tr>
            <th scope="col">Название</th>
            <th scope="col">Количество</th>
            <th scope="col">Цена</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list details as detail>
            <tr>
                <td>${detail.name}</td>
                <td>${detail.stock}</td>
                <td>${detail.price} ₽</td>
                <td>
                    <form action="/admin/provider/${provider.id}/delete/detail/${detail.id}" method="post">

                        <input type="hidden" value="${user.email}" name="email">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger m-3">
                            Удалить
                        </button>
                    </form>
                </td>

            </tr>
        <#else>
            <h3>Нет деталей</h3>
        </#list>
        </tbody>
    </table>
    <hr>
    <h1>Купить деталь</h1>
    <form action="/admin/buy/detail/from/${provider.id}" method="post">

        <label>Детали: <select name="detail" id="offer-select">
                <option value="">--Выберите деталь--</option>
                <#list details as detail>
                    <option value="${detail.id}"  data-stock="${detail.stock}">${detail.name}</option>
                <#else>
                    <h1 style="text-align: center">Ничего не найдено</h1>
                </#list>
            </select></label>
        <label>Введите количество купленных деталей: <input type="number" name="storagestock" required min="1" max=""></label>
        <input type="hidden" value="${user.email}" name="email">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-dark m-3">
            Купить
        </button>
    </form>
    <script>
        var select = document.getElementById('offer-select');
        var maxInput = document.getElementsByName('storagestock')[0];

        select.addEventListener('change', function() {
            var selectedOption = select.options[select.selectedIndex];
            var stock = selectedOption.getAttribute('data-stock');
            maxInput.max = stock;
        });

    </script>
</@t.template>
