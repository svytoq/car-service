<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои машины</h1>
    <hr>
    <table class="table table-hover table-dark table-striped">
        <thead>
        <tr>
            <th scope="col">Марка</th>
            <th scope="col">Модель</th>
            <th scope="col">Год выпуска</th>
        </tr>
        </thead>
        <tbody>
        <#list cars as car>
            <tr>
                <td>${(car.brand)!"null"}</td>
                <td>${(car.model)!""}</td>
                <td>${(car.creation_date?datetime?string('yyyy-MM-dd'))!""}</td>
            </tr>
        <#else>
            <h3>Нет машин</h3>
        </#list>
        </tbody>
    </table>
    <hr>
    <form action="/user/add/car" method="post" id="application">
        <h3>Добавить машину</h3>
        <label>Марка <input type="text" name="brand" required placeholder="Например, Toyota"></label>
        <label>Модель <input type="text" name="model" required placeholder="Например, Corolla"></label>
        <label>Дата выпуска <input type="text" name="creation_date" required placeholder="Например, 2018-01-20" pattern="^\d{4}-\d{2}-\d{2}$"></label>

        <input type="hidden" value="${user.email}" name="email">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <br><br>
        <button id="saveButton" type="submit" class="btn btn-dark">Отправить
        </button>
        <hr>
    </form>
</@t.template>
