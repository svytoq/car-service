<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Операторы колл-центра</h1><hr>
    <table class="table table-hover table-dark table-striped">
        <thead><tr>
            <th scope="col">Имя</th>
            <th scope="col">Фамилия</th>
            <th scope="col">Начало рабочего дня</th>
            <th scope="col">Конец рабочего дня</th>

        </tr>
        </thead>
        <tbody>
        <#list operators as operator>
            <tr>
                <td>${operator.employee.name}</td>
                <td>${operator.employee.surname}</td>
                <td>${operator.workingTimeStart}</td>
                <td>${operator.workingTimeEnd}</td>

            </tr>
        <#else>
            <h3>Нет работников</h3>
        </#list>
        </tbody>
    </table>
</@t.template>
