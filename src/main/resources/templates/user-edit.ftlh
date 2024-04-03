<#import "blocks/template.ftlh" as t>
<@t.template user1>
    <h1 style="text-align: center">Изменить пользователя - ${user.name}</h1>
    <hr>
    <form action="/admin/user/edit" method="post">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}"
                              onclick="toggleTextField()" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                </label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-dark">Сохранить</button>
        <br> <br>
    </form>


    <form action="/admin/add/employee/sto" method="post">
        <hr>
        <div id="snilsField" style="display: none;">
            <p>Сначала сохраните роль пользователя!</p>
            <label>СНИЛС: <input type="text" name="snils" pattern="^\d{3}-\d{3}-\d{3} \d{2}$" required></label>
            <label>Выберите СТО:
                <div style="overflow-y: scroll;height: 100px">
                    <#list stos as sto>
                        <div>
                            <label><input type="checkbox" name="${sto.name}">${sto.name}
                            </label>
                        </div>
                    </#list>
                </div>
            </label>
        </div>
        <br>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button id="saveButton" type="submit" class="btn btn-dark" style="display: none;">Сохранить сотрудника</button>
    </form>

    <form action="/admin/add/admin" method="post">
        <hr>
        <div id="adminField" style="display: none;">
            <p>Сначала сохраните роль пользователя и его СНИЛС при роли EMPLOYEE!</p></div>
        <br>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button id="saveButton5" type="submit" class="btn btn-dark" style="display: none;">Сохранить администратора
        </button>
    </form>

    <form action="/admin/add/worker" method="post">
        <div id="specializationField" style="display: none;">
            <hr>
            <p>Сначала сохраните роль пользователя и его СНИЛС при роли EMPLOYEE!</p>
            <label>Специализация рабочего: <input type="text" name="specialization" required></label>

        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button id="saveButton1" type="submit" class="btn btn-dark" style="display: none;">Сохранить работника</button>
    </form>

    <form action="/admin/add/operator" method="post">
        <div id="timeField" style="display: none;">
            <hr>
            <p>Сначала сохраните роль пользователя и его СНИЛС при роли EMPLOYEE!</p>
            <label>Начало рабочего дня: <input type="text" name="workingTimeStart" required></label>
            <label>Конец рабочего дня: <input type="text" name="workingTimeEnd" required></label>

        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <br>
        <button id="saveButton3" type="submit" class="btn btn-dark" style="display: none;">Сохранить оператора</button>
    </form>

    <form action="/admin/add/manufacturer" method="post">
        <div id="detailspecializationField" style="display: none;">
            <hr>
            <p>Сначала сохраните роль пользователя и его СНИЛС при роли EMPLOYEE!</p>
            <label>Специализация изготовителя деталей: <input type="text" name="detail_specialization" required></label>
        </div>
        <br>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button id="saveButton2" type="submit" class="btn btn-dark" style="display: none;">Сохранить изготовителя
        </button>
    </form>
    <script>
        window.addEventListener("load", toggleTextField);

        function toggleTextField() {
            var checkbox5 = document.querySelector('input[name="ROLE_ADMIN"]');
            var textField5 = document.getElementById("adminField");
            var saveButton5 = document.getElementById("saveButton5");


            var checkbox = document.querySelector('input[name="ROLE_EMPLOYEE"]');
            var textField = document.getElementById("snilsField");
            var saveButton = document.getElementById("saveButton");

            var checkbox1 = document.querySelector('input[name="ROLE_WORKER"]');
            var textField1 = document.getElementById("specializationField");
            var saveButton1 = document.getElementById("saveButton1");

            var checkbox2 = document.querySelector('input[name="ROLE_MANUFACTURER"]');
            var textField2 = document.getElementById("detailspecializationField");
            var saveButton2 = document.getElementById("saveButton2");

            var checkbox3 = document.querySelector('input[name="ROLE_OPERATOR"]');
            var textField3 = document.getElementById("timeField");
            var saveButton3 = document.getElementById("saveButton3");

            if (checkbox.checked) {
                textField.style.display = "block";
                saveButton.style.display = "block";
            } else {
                textField.style.display = "none";
                saveButton.style.display = "none";
            }

            if (checkbox1.checked) {
                textField1.style.display = "block";
                saveButton1.style.display = "block";
            } else {
                textField1.style.display = "none";
                saveButton1.style.display = "none";
            }

            if (checkbox2.checked) {
                textField2.style.display = "block";
                saveButton2.style.display = "block";
            } else {
                textField2.style.display = "none";
                saveButton2.style.display = "none";
            }

            if (checkbox3.checked) {
                textField3.style.display = "block";
                saveButton3.style.display = "block";
            } else {
                textField3.style.display = "none";
                saveButton3.style.display = "none";
            }

            if (checkbox5.checked) {
                textField5.style.display = "block";
                saveButton5.style.display = "block";
            } else {
                textField5.style.display = "none";
                saveButton5.style.display = "none";
            }
        }
    </script>
</@t.template>