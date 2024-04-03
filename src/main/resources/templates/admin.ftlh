<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Панель администратора</h1>
    <hr>
    <div>
        <h2 style="text-align: center">Работа с услугами</h2>
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
               data-toggle="collapse" href="/offer/addform" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Добавить услугу
            </a>
            &nbsp &nbsp &nbsp
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
               data-toggle="collapse" href="/offer/deleteform" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Удалить услугу
            </a>
        </div>
        <hr>
        <h2 style="text-align: center">Работа с заказами</h2>
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
               data-toggle="collapse" href="/admin/unallocated/purchases" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Нераспределенные заказы
            </a>
            &nbsp &nbsp &nbsp
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
               data-toggle="collapse" href="/admin/allocated/purchases" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Распределенные заказы
            </a>
        </div>
        <hr>
        <h2 style="text-align: center">Заказ и учет деталей и инструментов</h2>
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
               data-toggle="collapse" href="/admin/tools" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Инструменты на складе
            </a>
            &nbsp &nbsp &nbsp
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
               data-toggle="collapse" href="/admin/details" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Детали на складе
            </a>
            &nbsp &nbsp &nbsp
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
               data-toggle="collapse" href="/admin/detailproviders" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Поставщики
            </a>
        </div>
        <hr>
        <h2 style="text-align: center">Просмотр и изменение всех пользователей.</h2>
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
               data-toggle="collapse" href="/admin/users" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Пользователи
            </a>
        </div>

        <hr>
        <h2 style="text-align: center">Просмотр клиентов и сотрудников - работников, операторов и изготовителей
            деталей.</h2>
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%"
               data-toggle="collapse" href="/admin/clients" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Клиенты
            </a>
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 30%;margin-left: 5%"
                   data-toggle="collapse" href="/admin/employees" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Сотрудники
            </a>
        </div>
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 15%;margin-left: 5%"
               data-toggle="collapse" href="/admin/workers" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Работники
            </a>

            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 15%;margin-left: 5%"
               data-toggle="collapse" href="/admin/operators" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Операторы
            </a>

            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 15%;margin-left: 5%"
               data-toggle="collapse" href="/admin/manufacturers" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Изготовители
            </a>
        </div>

        <hr>
        <h2 style="text-align: center">Работа с СТО.</h2>
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 15%;margin-left: 5%"
               data-toggle="collapse" href="/admin/stos" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                СТО
            </a>
        </div>

        <hr>
        <h2 style="text-align: center">Обращения сотрудников</h2>
        <div style=" display: flex;
            height: 20%;
            flex-flow: row wrap;
            align-items: center;
            justify-content: center;">
            <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 15%;margin-left: 5%"
               data-toggle="collapse" href="/admin/workerreqs" role="button"
               aria-expanded="true" aria-controls="collapseExample">
                Перейти
            </a>

        </div>
    </div>
</@t.template>
