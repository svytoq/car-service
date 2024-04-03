<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Обращения пользователей</h1>
    <hr>
    <table class="table table-hover table-dark">
        <thead>
        <tr>
            <th scope="col">Пользователь</th>
            <th scope="col">Вопрос</th>
            <th scope="col">Решить вопрос</th>
        </tr>
        </thead>
        <#list questions as question>
            <tr>
                <td><a href="/user/${question.user.id}">${question.user.name} ${question.user.surname}</a></td>
                <td>
                    ${question.questionText}
                </td>
                <td>
                    <form action="/operator/delete/question/${question.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger m-3">
                            Закрыть
                        </button>
                    </form>
                </td>
            </tr>
        <#else>
            <h3>Нет обращений</h3>
        </#list>
    </table>
</@t.template>
