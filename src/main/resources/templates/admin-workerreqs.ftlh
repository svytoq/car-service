<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Обращения сотрудников</h1><hr>
    <div style="overflow-y: scroll;
                    height: 400px;">
        <table class="table table-hover table-dark table-striped">
            <thead><tr>
                <th scope="col">Автор</th>
                <th scope="col">Текст</th>
                <th scope="col">Удалить</th>
            </tr>
            </thead>
            <tbody>
            <#list reqs as req>
                <tr>
                    <td><a href="/user/${req.worker.employee.user.id}">${req.worker.employee.surname} ${req.worker.employee.name}</a></td>
                    <td>${req.requestText}</td>
                    <td>
                        <form action="/admin/delete/request/${req.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </td>
                </tr>
            <#else>
                <h3>Нет обращений</h3>
            </#list>
            </tbody>
        </table></div>

</@t.template>
