<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Клиенты</h1>
    <hr>
    <table class="table table-hover table-dark">
        <thead>
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Фамилия</th>
            <th scope="col">Почта</th>
            <th scope="col">Номер телефона</th>
        </tr>
        </thead>
        <tbody>
        <#list clients as client>
            <tr>
                <th>${client.name}</th>
                <th>${client.surname}</th>
                <th>${client.email}</th>
                <th>${client.phoneNumber}</th>

            </tr>
        <#else>
            <h3>Нет пользователей</h3>
        </#list>
        </tbody>
    </table>
</@t.template>
