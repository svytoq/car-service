<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Пользователи</h1>
    <hr>
    <div style="overflow-y: scroll;
                    height: 400px;">
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
                        <#if !user.isAdmin()>
                            <form action="/admin/user/ban/${user.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="submit" class="btn btn-light" value="Бан">
                            </form>
                        </#if>
                    </td>
                    <td><a href="/admin/user/edit/${user.id}">Редактировать</a></td>
                    <td><a href="/user/${user.id}">Смотреть</a></td>
                    <td>
                        <#if !user.isAdmin()>
                            <form action="/delete/user/${user.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-danger m-3">
                                    Удалить
                                </button>
                            </form>
                        </#if>
                    </td>
                </tr>
            <#else>
                <h3>Нет пользователей</h3>
            </#list>
        </table>
    </div>
    <a href="/admin/active/users">Активные пользователи</a>


</@t.template>
