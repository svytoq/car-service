<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Сотрудники</h1><hr>
    <table class="table table-hover table-dark table-striped">
        <thead><tr>
            <th scope="col">Имя</th>
            <th scope="col">Фамилия</th>
            <th scope="col">Снилс</th>
        </tr>
        </thead>
        <tbody>
        <#list employees as employee>
            <tr>
                <td>${employee.name}</td>
                <td>${employee.surname}</td>
                <td>${employee.snils}</td>
            </tr>
        <#else>
            <h3>Нет сотрудников</h3>
        </#list>
        </tbody>
    </table>
</@t.template>
