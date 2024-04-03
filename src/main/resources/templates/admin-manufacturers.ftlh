<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Изготовители деталей</h1><hr>
    <table class="table table-hover table-dark table-striped">
        <thead><tr>
            <th scope="col">Имя</th>
            <th scope="col">Фамилия</th>
            <th scope="col">Специализация</th>
        </tr>
        </thead>
        <tbody>
        <#list manufacturers as manufacturer>
            <tr>
                <td>${manufacturer.employee.name}</td>
                <td>${manufacturer.employee.surname}</td>
                <td>${manufacturer.detail_specialization}</td>
            </tr>
        <#else>
            <h3>Нет изготовителей</h3>
        </#list>
        </tbody>
    </table>
</@t.template>
