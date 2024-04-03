<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Работники</h1><hr>
    <table class="table table-hover table-dark table-striped">
        <thead><tr>
            <th scope="col">Имя</th>
            <th scope="col">Фамилия</th>
            <th scope="col">Специализация</th>
        </tr>
        </thead>
        <tbody>
        <#list workers as worker>
            <tr>
                <td>${worker.employee.name}</td>
                <td>${worker.employee.surname}</td>
                <td>${worker.specialization}</td>
            </tr>
        <#else>
            <h3>Нет работников</h3>
        </#list>
        </tbody>
    </table>
</@t.template>
