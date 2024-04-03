<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Активные пользователи</h1>
    <hr>
    <table class="table table-hover table-dark">
        <thead>
        <tr>
            <th scope="col">Почта</th>
            <th scope="col">Номер телефона</th>
            <th scope="col">Активность</th>
            <th scope="col">Роль</th>
            <th scope="col">Забанить</th>
            <th scope="col">Редактировать</th>
            <th scope="col">Подробная информация</th>
            <th scope="col">Удалить пользователя</th>
        </tr>
        </thead>
        <#list users as user>
            <tr>
                <td>${user.email}</td>
                <td>${user.phoneNumber}</td>
                <td><#if user.active>true<#else>false</#if></td>
                <td><#list user.roles as role>${role} </#list></td>
                <td>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light" value="Бан">
                    </form>
                </td>
                <td><a href="/admin/user/edit/${user.id}">Редактировать</a></td>
                <td><a href="/user/${user.id}">Смотреть</a></td>
                <td> <form action="/delete/user/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger m-3">
                            Удалить
                        </button>
                    </form></td>
            </tr>
        <#else>
            <h3>Нет пользователей</h3>
        </#list>
    </table>
    <a href="/admin/users">Все пользователи</a>

</@t.template>
