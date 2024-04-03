<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Работники СТО</h1>
    <hr>
    <table class="table table-hover table-dark table-striped">
        <thead>
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Фамилия</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list employees as employee>
            <tr>
                <td>${employee.name}</td>
                <td>${employee.surname}</td>
                <td>
                    <form action="/admin/sto/${sto.id}/delete/employee/${employee.id}" method="post">

                        <input type="hidden" value="${user.email}" name="email">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger m-3">
                            Удалить
                        </button>
                    </form>
                </td>
            </tr>
        <#else>
            <h3>Нет работников</h3>
        </#list>
        </tbody>
    </table>
    <hr>
</@t.template>
